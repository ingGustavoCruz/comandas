const cart = {}; // Carrito vacío

// Función para actualizar la vista del carrito
function updateCart() {
    const orderWrapper = document.querySelector('.order-wrapper');
    orderWrapper.innerHTML = ''; // Limpiamos el carrito

    let subtotal = 0;
    let totalItems = 0; // Variable para contar los productos en el carrito

    Object.keys(cart).forEach(productId => {
        const product = cart[productId];
        subtotal += product.price * product.quantity;
        totalItems += product.quantity; // Sumar la cantidad de productos

        orderWrapper.innerHTML += `
            <div class="order-card" data-id="${productId}">
                <img src="img/${product.img}.jpg" alt="" class="order-image">
                <div class="order-detail">
                    <p>${product.name}</p>
                    <i class="fa-regular fa-circle-xmark" onclick="removeFromCart(${productId})"></i> 
                    <input type="text" value="${product.quantity}" readonly>
                    <button class="quantity-btn" onclick="decreaseQuantity('${productId}')">-</button>
                    <button class="quantity-btn second" onclick="increaseQuantity('${productId}')">+</button>
                </div>
                <h4 class="order-price">$${(product.price * product.quantity).toFixed(2)}</h4>
            </div>
        `;
    });

    // Actualizar el subtotal y el total
    document.querySelector('.order-total span').innerText = `$${subtotal.toFixed(2)}`;
    document.getElementById('total').innerText = `$${subtotal.toFixed(2)}`;

    // Actualizar el contador del carrito
    updateCartCount(totalItems);
}

// Función para actualizar el contador del carrito
function updateCartCount(count) {
    const cartCountElement = document.getElementById('cart-count');
    if (count > 0) {
        cartCountElement.style.display = 'inline-block'; // Mostrar el círculo
        cartCountElement.textContent = count; // Actualizar el número
    } else {
        cartCountElement.style.display = 'none'; // Ocultar si no hay productos
    }
}

// Función para agregar productos al carrito
function addToCart(productId, productName, productPrice, productImg) {
    if (cart[productId]) {
        cart[productId].quantity += 1;
    } else {
        cart[productId] = {
            name: productName,
            price: productPrice,
            img: productImg,
            quantity: 1
        };
    }
    updateCart();
}

// Función para eliminar un producto del carrito
function removeFromCart(productId) {
    delete cart[productId];
    updateCart();
}

// Escuchar los clics en las tarjetas "dashboard-card"
document.querySelectorAll('.dashboard-card').forEach(card => {
    card.addEventListener('click', function () {
        const productId = this.getAttribute('data-id');
        const productName = this.getAttribute('data-name');
        const productPrice = parseFloat(this.getAttribute('data-price'));
        const productImg = this.getAttribute('data-img');

        // Agregar producto al carrito
        addToCart(productId, productName, productPrice, productImg);
    });
});

// Función para aumentar la cantidad de un producto en el carrito
function increaseQuantity(productId) {
    if (cart[productId]) {
        cart[productId].quantity += 1;
    }
    updateCart(); // Actualizar la vista del carrito
}

// Función para disminuir la cantidad de un producto en el carrito
function decreaseQuantity(productId) {
    if (cart[productId]) {
        cart[productId].quantity -= 1;
        if (cart[productId].quantity === 0) {
            delete cart[productId]; // Si la cantidad es 0, eliminamos el producto
        }
    }
    updateCart(); // Actualizar la vista del carrito
}

// Función para eliminar directamente un producto del carrito
function removeFromCart(productId) {
    delete cart[productId];
    updateCart(); // Actualizar la vista del carrito
}

document.querySelector('#check-order').addEventListener('click', function () {
    // Convertir el carrito a JSON
    const cartData = JSON.stringify(cart);

    // Obtener el total del pedido
    const total = parseFloat(document.getElementById('total').textContent.replace('$', ''));

    // Enviar el carrito al servidor usando fetch
    fetch('./controllers/pedido.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            cart: cartData,
            total: total
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            alert('Pedido confirmado con éxito.');
            // Aquí puedes redirigir a una página de confirmación o limpiar el carrito
            clearCart(); // Limpiar el carrito una vez que se confirma el pedido
        } else {
            alert('Hubo un error al procesar el pedido: ' + data.message);
        }
    })
    .catch(error => console.error('Error:', error));
});

// Función para limpiar el carrito
function clearCart() {
    for (let key in cart) {
        delete cart[key]; // Vaciar el carrito
    }
    updateCart(); // Actualizar la vista del carrito
}
