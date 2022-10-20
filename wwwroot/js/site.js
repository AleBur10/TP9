function MostrarMasInfo(idJ) {
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/MostrarMasInfoAjax',
            data: { IdJuego: idJ },
            success:
                function (response) {
                    console.log(response);
                    $("#FechaCreacion").html("Fecha de lanzamiento: " + response.fechaCreacion.substr(0, response.fechaCreacion.length - 10));
                    $("#Descripcion").html(response.descripcion);
                    $("#Precio").html("Precio: " + response.precio + "USD");
                }

        })
}

function Likes(idJ) {
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/LikesAjax',
            data: { IdJuego: idJ },
            success:
                function (response) {
                    $("#BotonLike").attr("src","/CorazonRojo.jpg");
                }

        })
}
