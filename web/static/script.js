const modal = document.getElementById('modal')
const modalBg = document.getElementById('modalBg')

const modalBgAnim = [
    {opacity: 0},
    {opacity: 1},
];
const modalAnim = [
    {transform: 'translateY(-100%) rotateX(-90deg) rotateY(-20deg) scale(0.85)'},
    {transform: 'translateY(-50%) rotateX(0) rotateY(0) scale(1)'},
];
const modalAnimDuration = 250;


function fetchHouseCard(url, houseId) {
    fetch(url, {
        method: "GET",
        headers: {
            "X-Requested-With": "XMLHttpRequest",
            "houseId": houseId,
        },
    })
        .then(response => response.json())
        .then(data => {
            const house = data.house;
            const images = data.images;

            let activity = "active"
            let imgString = ""
            for (let i = 0; i < images.length; i++) {
                imgString += `
                <div class="carousel-item ${activity}" >
                    <img src="${images[i]}" alt="bababa" class="house-img" id="houseImg${i}">
                </div>
                `
                activity = ""
            }

            let controlBtnsString = "";
            activity = "active"
            for (let i = 0; i < images.length; i++) {
                controlBtnsString += `
                    <button type="button" data-bs-target="#myCarousel${houseId}" data-bs-slide-to="${i}" class="${activity}" aria-current="true" aria-label="Slide ${i + 1}"></button>`
                activity = ""
            }

            const carouselStr = `
                            <div id="myCarousel${houseId}" class="carousel slide carousel-mini" data-bs-ride="carousel" data-interval="false">
        <div class="carousel-indicators">
            ${controlBtnsString}
        </div>
        <div class="carousel-inner" style="height: 100%; border-radius: 10px">
            ${imgString}
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel${houseId}" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel${houseId}" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>    
            `
            modal.innerHTML = `
                <div class="modal-body">
                
                <!--<model-viewer alt="Neil Armstrong's Spacesuit from the Smithsonian Digitization Programs Office and National Air and Space Museum" src="untitled.glb"  shadow-intensity="1" camera-controls touch-action="pan-y" auto-rotate></model-viewer>-->
                
                ${carouselStr}
                 
                <div class="p-4">
                <h2 class="fw-bold mb-0" style="text-align: center">Дом ${house.xSize} X ${house.ySize}</h2>
                <ul class="d-grid gap-4 my-5 list-unstyled small">
                    <li class="d-flex gap-4">
                        <div>
                            <h5 class="mb-0">Площадь застройки</h5>
                            ${house.area}м²
                        </div>
                    </li>
                    <li class="d-flex gap-4">
                        <div>
                            <h5 class="mb-0">Спальни</h5>
                            ${house.bedrooms}
                        </div>
                    </li>
                    <li class="d-flex gap-4">
                        <div>
                            <h5 class="mb-0">Санузлы</h5>
                            ${house.toilets}
                        </div>
                    </li>
                    <li class="d-flex gap-4">
                        <div>
                            <h5 class="mb-0">Время строительства</h5>
                            ${house.constructingTime} мес.
                        </div>
                    </li>
                    <li class="d-flex gap-4" style="font-weight: bolder; align-items: flex-end; flex-direction: column; text-align: right; font-size: 15pt">
                        <div>
                            <h5 class="mb-0" style="font-weight: bold; font-size: 20pt">Стоимость</h5>
                            от ${house.price} руб.
                        </div>
                    </li>
                </ul>
                <div style="width: 100%; text-align: center" id="close">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40">
                        <circle cx="20" cy="20" r="19" stroke="grey" stroke-width="1" fill="rgba(0,0,0,0)"></circle>
                        <line x1="10" y1="10" x2="30" y2="30" style="stroke:grey; stroke-width:1"></line>
                        <line x1="10" y1="30" x2="30" y2="10" style="stroke:grey; stroke-width:1"></line>
                    </svg>
                </div>
               </div>
            </div>
            `;

            document.getElementById("close").onclick = () => {
                modalBg.animate(modalBgAnim, {
                    duration: modalAnimDuration,
                    iterations: 1,
                    direction: "reverse",
                })
                modal.animate(modalAnim, {
                    duration: modalAnimDuration,
                    iterations: 1,
                    direction: "reverse",
                })
                setTimeout(() => {
                    modalBg.style.display = 'none';
                }, modalAnimDuration - 50)
            }

            document.maxWidth = 0;
            document.minHeight = 10000000;
            document.imgsLoaded = 0
            document.maxAspect = 0
            for (let i = 0; i < images.length; i++) {
                const img = document.getElementById("houseImg" + i)
                img.onload = () => {
                    const aspectRatio = img.naturalWidth / img.naturalHeight;
                    document.maxAspect = Math.max(aspectRatio, document.maxAspect)
                    document.maxWidth = Math.max(document.maxWidth, img.clientHeight * aspectRatio);
                    modal.style.width = Math.min(window.innerWidth, document.maxWidth) + "px";
                    document.imgsLoaded += 1
                    if (document.imgsLoaded == images.length)
                        modal.getElementsByClassName('carousel')[0].style.height = parseInt(modal.style.width) / document.maxAspect + "px"
                }
            }

            let imgsElements = document.getElementsByClassName("house-img");
            for (let el of imgsElements) {
                el.onclick = (event) => {
                    const zoomBg = document.getElementById("zoomBg");
                    if (!document.zoomed) {
                        zoomBg.style.display = "block";
                        const copy = el.cloneNode();
                        copy.onclick = el.onclick
                        copy.style.objectFit = "contain";
                        copy.style.transform = "scale(0.99)"
                        zoomBg.appendChild(copy)
                        document.zoomed = true;
                    } else {
                        zoomBg.style.display = "none";
                        zoomBg.innerHTML = "";
                        document.zoomed = false;
                    }
                }
            }
        });
}