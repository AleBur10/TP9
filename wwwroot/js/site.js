function MostrarInfoJuego(idJ)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/MostrarMasInfoAjax',
            data: { IdJuego: idJ },
            success:
                function(response)
                {
                    $("#FechaJuego").html(response.FechaCreacion);
                    $("#TextoModal").html(response.DescripcionJuego);
                    $("#PrecioDelJuego").html(response.Precio);
                }
             
        })
}