function MostrarMasInfo(idJ) {
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/MostrarMasInfoAjax',
        data: { IdJuego: idJ },
        success: function(response) {
            console.log(response);
            $("#FechaCreacion").html("Fecha de lanzamiento: " + response.fechaCreacion.substr(0, response.fechaCreacion.length - 10));
            $("#Descripcion").html(response.descripcion);
            $("#Precio").html("Precio: " + response.precio + "USD");
        }

    })
}

function Likes(idJ, element) {
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/LikesAjax',
        data: { IdJuego: idJ },
        success: function(response) {
            //$("#BotonLike").attr("src","/CorazonRojo.jpg"); 
        }

    })
    console.log(element);
}

function CrearCuenta() {
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/CrearCuentaAjax',
        //data: { IdUsuario: idU },
        success: function(response) {
            console.log('me gustan las culonas');
            let content = "Nombre de usuario: <input type='text' class='play' id='player' name='Nombre' placeholder='Ingrese su nombre'></input>"
            $("#CrearCuenta").html(content);
        }

    })
}