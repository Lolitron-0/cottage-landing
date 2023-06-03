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
                    <button type="button" data-bs-target="#myCarousel${houseId}" data-bs-slide-to="${i}" class="${activity}" aria-current="true" aria-label="Slide ${i + 1}"></button>
                `
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
                            <h5 class="mb-0">Размер</h5>
                            12х12
                        </div>
                    </li>
                    <li class="d-flex gap-4">
                        <div>
                            <h5 class="mb-0">Материал</h5>
                            самый хороший
                        </div>
                    </li>
                    <li class="d-flex gap-4">
                        <div>
                            <h5 class="mb-0">Цена</h5>
                            ₽${house.price} млн.
                        </div>
                    </li>
                </ul>
                </div>
            </div>
            `;

            document.maxWidth = 0;
            for (let i = 0; i < images.length; i++) {
                const img = document.getElementById("houseImg" + i)
                img.onload = () => {
                    const aspectRatio = img.naturalWidth / img.naturalHeight;
                    document.maxWidth = Math.max(document.maxWidth, img.clientHeight * aspectRatio);
                    modal.style.width = Math.min(window.innerWidth, document.maxWidth)  + "px";
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