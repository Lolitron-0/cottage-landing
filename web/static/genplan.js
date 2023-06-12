function distSq(a, b) {
    return Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2)
}

function convertToCanvas(points, startX, startY, imageWidth, imageHeight) {
    let res = []
    for (const point of points) {
        res.push({
            x: startX + imageWidth * point.x,
            y: startY + imageHeight * point.y
        })
    }
    return res
}

const SALE_STATE = {
    ON_SALE: 'green',
    RESERVED: 'orange',
    SOLD: 'red',
}

class Area {
    constructor(pts, number, image, acr, saleState) {
        this.points = pts
        this.number = number
        this.hovered = false
        this.selected = false
        this.image = image
        this.acreage = acr
        this.color = saleState
    }

    getAvailabilityText() {
        switch (this.color) {
            case SALE_STATE.ON_SALE:
                return "Этот участок можно купить"
            case SALE_STATE.RESERVED:
                return "Этот участок забронирован"
            case SALE_STATE.SOLD:
                return "Этот участок куплен"
        }
    }

    //point in clientCoords
    isPointInside(point) {
        let result = false;
        let j = this.points.length - 1;
        for (let i = 0; i < this.points.length; i++) {
            if (
                ((this.points[i].y < point.y && this.points[j].y >= point.y) ||
                    (this.points[j].y < point.y && this.points[i].y >= point.y)) &&
                this.points[i].x +
                ((point.y - this.points[i].y) *
                    (this.points[j].x - this.points[i].x)) /
                (this.points[j].y - this.points[i].y) <
                point.x
            )
                result = !result;

            j = i;
        }

        return result;
    }

    getCenter() {
        const glob = convertToCanvas(this.points, startX, startY, imageWidth, imageHeight);
        let mx = glob[0]
        let i0 = 0;

        // ewwwwww
        if (this.number === 14) // ugly as FUCK
            i0 = 1; // обоссыте меня

        for (const point of glob)
            if (distSq(glob[i0], point) > distSq(glob[i0], mx))
                mx = point
        return {
            x: (glob[i0].x + mx.x) / 2,
            y: (glob[i0].y + mx.y) / 2
        }
    }

    fill() {
        cx.fillStyle = "rgba(255,255,255,0.2)"
        cx.fill()
    }

    draw() {
        const glob = convertToCanvas(this.points, startX, startY, imageWidth, imageHeight)
        cx.strokeStyle = this.color;
        cx.lineWidth = 3;
        cx.moveTo(glob[0].x, glob[0].y);
        cx.beginPath();
        for (let i = 0; i < glob.length; i++) {
            cx.lineTo(glob[i].x, glob[i].y);
        }
        cx.closePath();
        cx.stroke();
    }

    idle() {
        const r = canvas.height / 40
        const center = this.getCenter()
        cx.fillStyle = this.color
        cx.strokeStyle = "white"
        cx.lineWidth = 3
        cx.beginPath()
        cx.ellipse(center.x, center.y, r, r, 0, 0, 2 * Math.PI)
        cx.closePath()
        cx.stroke()
        cx.fill()

        cx.fillStyle = "white"
        cx.font = r + "px monospace"
        cx.textAlign = "center"
        cx.fillText(this.number, center.x, center.y + r / 4)
    }
}

let idx = -1

function getNextImage() {
    idx = (idx + 1) % document.previews.length
    return document.previews[idx]
}

const popup = document.getElementById("popup")

function drawPopup(area) {
    const areaCenter = area.getCenter()

    popup.style.display = "flex"
    popup.style.left = (canvas.getBoundingClientRect().left - document.body.getBoundingClientRect().left + areaCenter.x - popup.clientWidth / 2) + "px"
    popup.style.top = (canvas.getBoundingClientRect().top - document.body.getBoundingClientRect().top + areaCenter.y - popup.clientHeight / 2) + "px"

    //const w = 100, h = 100;
    //cx.fillStyle = "white"
    //cx.roundRect(areaCenter.x - w / 2, areaCenter.y - h / 2, 100, 100, 10, true, false)
}

document.getElementById("popup-close").onclick = () => {
    popup.style.display = "none"
    areas.forEach((area) => area.selected = false)
}

let legendPoint =
    {
        "x": 0.10795454545454546,
        "y": 0.16835016835016836
    }


// i am fucking retarded
function drawLegend() {
    const r = canvas.height / 50
    let color, text;
    for (const i in [0, 1, 2]) {
        let center = {x: legendPoint.x, y: legendPoint.y}
        center.y += (2 * r + r / 4) * i
        if (i == 0) {
            color = SALE_STATE.ON_SALE
            text = "В продаже"
        } else if (i == 1) {
            color = SALE_STATE.RESERVED
            text = "Забронировано"
        } else {
            color = SALE_STATE.SOLD
            text = "Продано"
        }

        cx.fillStyle = color
        cx.strokeStyle = "white"
        cx.lineWidth = 3
        cx.beginPath()
        cx.ellipse(center.x, center.y, r, r, 0, 0, 2 * Math.PI)
        cx.closePath()
        cx.stroke()
        cx.fill()

        cx.fillStyle = "white"
        cx.font = 1.7 * r + "px monospace"
        cx.textAlign = "start"
        cx.fillText(text, center.x + r + 10, center.y + r / 2)
    }
}


const areas = [
    new Area([
        {
            "x": 0.1989247311827957,
            "y": 0.4029022301871764
        },
        {
            "x": 0.2567204301075269,
            "y": 0.38060035842293904
        },
        {
            "x": 0.27598566308243727,
            "y": 0.36785643170051774
        },
        {
            "x": 0.2862903225806452,
            "y": 0.5191905615292712
        },
        {
            "x": 0.23297491039426524,
            "y": 0.5303414974113899
        },
        {
            "x": 0.2325268817204301,
            "y": 0.5191905615292712
        },
        {
            "x": 0.18996415770609318,
            "y": 0.5040571485463958
        }
    ], 23, getNextImage(), 12.07, SALE_STATE.RESERVED),
    new Area([
        {
            "x": 0.28046594982078854,
            "y": 0.3638739545997611
        },
        {
            "x": 0.3481182795698925,
            "y": 0.318473715651135
        },
        {
            "x": 0.36169014084507045,
            "y": 0.5075586854460093
        },
        {
            "x": 0.2916666666666667,
            "y": 0.5215800477897252
        }
    ], 21, getNextImage(), 12, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.35125448028673834,
            "y": 0.31688072481083235
        },
        {
            "x": 0.41487455197132617,
            "y": 0.27546296296296297
        },
        {
            "x": 0.4292114695340502,
            "y": 0.49051672640382316
        },
        {
            "x": 0.36469534050179214,
            "y": 0.5048536439665472
        }
    ], 19, getNextImage(), 13.61, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.42025089605734767,
            "y": 0.273073476702509
        },
        {
            "x": 0.4637096774193548,
            "y": 0.24280665073675825
        },
        {
            "x": 0.5206093189964157,
            "y": 0.25634707287933095
        },
        {
            "x": 0.517921146953405,
            "y": 0.48016228594185584
        },
        {
            "x": 0.4717741935483871,
            "y": 0.48095878136200715
        },
        {
            "x": 0.4345878136200717,
            "y": 0.49051672640382316
        }
    ], 17, getNextImage(), 21, SALE_STATE.SOLD),
    new Area([
        {
            "x": 0.5255376344086021,
            "y": 0.25714356829948226
        },
        {
            "x": 0.5577956989247311,
            "y": 0.2643120270808443
        },
        {
            "x": 0.5922939068100358,
            "y": 0.25634707287933095
        },
        {
            "x": 0.5909498207885304,
            "y": 0.48095878136200715
        },
        {
            "x": 0.5228494623655914,
            "y": 0.48016228594185584
        }
    ], 15, getNextImage(), 15, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.5967741935483871,
            "y": 0.25634707287933095
        },
        {
            "x": 0.6599462365591398,
            "y": 0.2412136598964556
        },
        {
            "x": 0.6586021505376344,
            "y": 0.4833482676224612
        },
        {
            "x": 0.5958781362007168,
            "y": 0.4817552767821585
        }
    ], 13, getNextImage(), 15, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.6648745519713262,
            "y": 0.24041716447630426
        },
        {
            "x": 0.703853046594982,
            "y": 0.23006272401433692
        },
        {
            "x": 0.7558243727598566,
            "y": 0.3391825965750697
        },
        {
            "x": 0.7773297491039427,
            "y": 0.4753833134209478
        },
        {
            "x": 0.774641577060932,
            "y": 0.4761798088410992
        },
        {
            "x": 0.774641577060932,
            "y": 0.48892373556352053
        },
        {
            "x": 0.6635304659498208,
            "y": 0.4841447630426125
        }
    ], 11, getNextImage(), 21, SALE_STATE.SOLD),
    new Area([
        {
            "x": 0.18548387096774194,
            "y": 0.5916716447630426
        },
        {
            "x": 0.2567204301075269,
            "y": 0.5789277180406213
        },
        {
            "x": 0.26881720430107525,
            "y": 0.7804410593389088
        },
        {
            "x": 0.17921146953405018,
            "y": 0.7294653524492234
        },
        {
            "x": 0.1778673835125448,
            "y": 0.6275139386698526
        },
        {
            "x": 0.18010752688172044,
            "y": 0.604415571485464
        },
        {
            "x": 0.18458781362007168,
            "y": 0.604415571485464
        }
    ], 27, getNextImage(), 15, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.26030465949820786,
            "y": 0.5781312226204699
        },
        {
            "x": 0.3086917562724014,
            "y": 0.5669802867383512
        },
        {
            "x": 0.3207885304659498,
            "y": 0.7669006371963362
        },
        {
            "x": 0.2746415770609319,
            "y": 0.7844235364396654
        },
        {
            "x": 0.27195340501792115,
            "y": 0.7820340501792115
        }
    ], 26, getNextImage(), 10, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.3118279569892473,
            "y": 0.5669802867383512
        },
        {
            "x": 0.3588709677419355,
            "y": 0.5574223416965353
        },
        {
            "x": 0.3709677419354839,
            "y": 0.7485812425328554
        },
        {
            "x": 0.3234767025089606,
            "y": 0.7653076463560334
        }
    ], 25, getNextImage(), 10, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.36379928315412186,
            "y": 0.5566258462763839
        },
        {
            "x": 0.4345878136200717,
            "y": 0.5406959378733572
        },
        {
            "x": 0.4484767025089606,
            "y": 0.7278723616089208
        },
        {
            "x": 0.41308243727598565,
            "y": 0.7342443249701314
        },
        {
            "x": 0.37410394265232977,
            "y": 0.7477847471127042
        }
    ], 24, getNextImage(), 14, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.4390681003584229,
            "y": 0.5391029470330546
        },
        {
            "x": 0.47939068100358423,
            "y": 0.5287485065710872
        },
        {
            "x": 0.5022401433691757,
            "y": 0.5303414974113899
        },
        {
            "x": 0.5026881720430108,
            "y": 0.7191109119872561
        },
        {
            "x": 0.4525089605734767,
            "y": 0.7278723616089208
        }
    ], 22, getNextImage(), 11, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.5062724014336918,
            "y": 0.5303414974113899
        },
        {
            "x": 0.5560035842293907,
            "y": 0.5319344882516925
        },
        {
            "x": 0.556899641577061,
            "y": 0.7270758661887694
        },
        {
            "x": 0.5058243727598566,
            "y": 0.7183144165671047
        }
    ], 20, getNextImage(), 10, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.5604838709677419,
            "y": 0.5311379928315412
        },
        {
            "x": 0.6084229390681004,
            "y": 0.5319344882516925
        },
        {
            "x": 0.6088709677419355,
            "y": 0.7366338112305855
        },
        {
            "x": 0.5591397849462365,
            "y": 0.7278723616089208
        }
    ], 18, getNextImage(), 10, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.6124551971326165,
            "y": 0.5319344882516925
        },
        {
            "x": 0.660394265232975,
            "y": 0.5327309836718439
        },
        {
            "x": 0.6586021505376344,
            "y": 0.7414127837514934
        },
        {
            "x": 0.6115591397849462,
            "y": 0.7366338112305855
        }
    ], 16, getNextImage(), 10, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.6635304659498208,
            "y": 0.5335274790919953
        },
        {
            "x": 0.7132616487455197,
            "y": 0.5359169653524493
        },
        {
            "x": 0.7101254480286738,
            "y": 0.7175179211469535
        },
        {
            "x": 0.6698028673835126,
            "y": 0.7430057745917961
        },
        {
            "x": 0.6630824372759857,
            "y": 0.7422092791716448
        }
    ], 14, getNextImage(), 10.11, SALE_STATE.ON_SALE),
    new Area([
        {
            "x": 0.7172939068100358,
            "y": 0.5351204699322979
        },
        {
            "x": 0.7862903225806451,
            "y": 0.5398994424532059
        },
        {
            "x": 0.78584229390681,
            "y": 0.5502538829151732
        },
        {
            "x": 0.7912186379928315,
            "y": 0.5518468737554759
        },
        {
            "x": 0.8024193548387096,
            "y": 0.6227349661489446
        },
        {
            "x": 0.7934587813620072,
            "y": 0.6657457188371166
        },
        {
            "x": 0.71415770609319,
            "y": 0.7159249303066507
        }
    ], 12, getNextImage(), 12, SALE_STATE.ON_SALE)
]

const canvas = document.getElementById("planCanvas")
const cx = canvas.getContext("2d")
canvas.width = canvas.clientWidth
canvas.height = canvas.clientHeight
const image = document.getElementById("planImage")
const clickImage = document.getElementById("clickImage")
let startX, startY, imageWidth, imageHeight;

function init() {
    const aspectRatio = image.naturalWidth / image.naturalHeight;
    const w = canvas.width;
    const h = canvas.width / aspectRatio;
    canvas.height = h
    canvas.style.height = h + "px"
    cx.drawImage(image, 0, 0, w, h)
    startX = 0;
    startY = 0;
    imageWidth = w;
    imageHeight = h;
    legendPoint = convertToCanvas([legendPoint], startX, startY, imageWidth, imageHeight)[0]
    render()
}


image.onload = (e) => {
    const aspectRatio = image.naturalWidth / image.naturalHeight;
    const w = canvas.width;
    const h = canvas.width / aspectRatio;
    canvas.height = h
    canvas.style.height = h + "px"
    cx.drawImage(image, 0, 0, w, h)
    startX = 0;
    startY = 0;
    imageWidth = w;
    imageHeight = h;
    legendPoint = convertToCanvas([legendPoint], startX, startY, imageWidth, imageHeight)[0]
    render()
}


clickImage.onload = () => {
    canvas.wokeUp = false
    render()
}

let points = []

function render() {
    cx.fillStyle = "white"
    cx.fillRect(0, 0, canvas.width, canvas.height)
    cx.drawImage(image, 0, 0, imageWidth, imageHeight)

    if (!canvas.wokeUp) {
        cx.drawImage(clickImage, 0, 0, imageWidth, imageHeight)
        return
    }

    for (const area of areas) {

        if (area.hovered || area.selected) {
            area.draw()
            area.fill()
            cx.closePath()
        }
        area.idle()
    }

    //drawLegend();

    for (const area of areas) {
        if (area.selected)
            drawPopup(area)
    }

}

canvas.onmousemove = (e) => {
    const clientX = e.clientX - canvas.getBoundingClientRect().x - startX;
    const clientY = e.clientY - canvas.getBoundingClientRect().y - startY;
    const clientPoint = {x: clientX / imageWidth, y: clientY / imageHeight}

    for (let area of areas) {
        area.hovered = area.isPointInside(clientPoint);
    }

    render()
}

canvas.onmouseup = (e) => {
    if (!canvas.wokeUp) {
        canvas.wokeUp = true
        render()
        return
    }
    const clientX = e.clientX - canvas.getBoundingClientRect().x - startX;
    const clientY = e.clientY - canvas.getBoundingClientRect().y - startY;
    const clientPoint = {x: clientX / imageWidth, y: clientY / imageHeight}

    //logedits(e)
    for (let area of areas) {
        area.selected = area.isPointInside(clientPoint);
        if (area.selected) {
            popup.getElementsByTagName("img")[0].src = area.image
            document.getElementById("acreage").innerHTML = area.acreage
            document.getElementById("number").innerHTML = area.number
            document.getElementById("availability").innerHTML = area.getAvailabilityText()
            document.getElementById("availability").style.color = area.color

            popup.classList.remove("animated-fade")
            void popup.offsetWidth;
            popup.classList.add("animated-fade")
        }
    }
    render()
}

function logedits(e) {
    const clientX = e.clientX - canvas.getBoundingClientRect().x - startX;
    const clientY = e.clientY - canvas.getBoundingClientRect().y - startY;

    points.push({x: clientX / imageWidth, y: clientY / imageHeight})

    let glob = convertToCanvas(points, startX, startY, imageWidth, imageHeight)

    cx.beginPath()
    for (const point of glob) {
        cx.lineTo(point.x, point.y)
    }
    cx.fill()

    console.log(points)
}
