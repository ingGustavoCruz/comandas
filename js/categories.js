document.addEventListener("DOMContentLoaded", function() {
    const categoryLinks = document.querySelectorAll(".dashboard-menu a");
    const productCards = document.querySelectorAll(".dashboard-card");

    categoryLinks.forEach(link => {
        link.addEventListener("click", function(e) {
            e.preventDefault();

            // Remover la clase 'active' de todas las categorías
            categoryLinks.forEach(link => link.classList.remove("active"));
            // Añadir la clase 'active' al enlace actual
            this.classList.add("active");

            const selectedCategory = this.getAttribute("data-categoria");

            // Mostrar/ocultar productos según la categoría seleccionada
            productCards.forEach(card => {
                const productCategory = card.getAttribute("data-categoria");

                if (selectedCategory === "todos" || selectedCategory === productCategory) {
                    card.style.display = "block"; // Mostrar productos
                } else {
                    card.style.display = "none"; // Ocultar productos
                }
            });
        });
    });
});
