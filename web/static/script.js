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
            modal.innerHTML = `
                <div class="modal-body p-5">
                <h2 class="fw-bold mb-0">${house.name}</h2>

                <ul class="d-grid gap-4 my-5 list-unstyled small">
                    <li class="d-flex gap-4">
                        <div>
                            <h5 class="mb-0">Размер</h5>
                            12х12
                        </div>
                    </li>
                    <li class="d-flex gap-4">
                        <div>
                            <h5 class="mb-0">Материалллллл</h5>
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
                <a class="btn btn-lg btn-primary mt-5 w-100" href="https://cdn.discordapp.com/attachments/964222431571091516/1098266601964453898/doc_2022-11-10_13-44-37.mp4">Связаться
                </a>
            </div>
            `;
        });
}