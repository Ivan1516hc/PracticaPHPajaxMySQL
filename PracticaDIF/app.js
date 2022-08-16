$(function() {
    let edit = false;
    fetchServicios();
    console.log("jQuery esta funcionando");

    //Ocultar contenedor de resultados de busqueda
    $('#servicios-result').hide();
    //Resibir las pulsaciones del teclado
    $('#search').keyup(function(e) {
        //If para identificar si #search contiene algo
        if ($('#search').val()) {
            //Guardar lo que se este ingresando
            let search = $('#search').val();
            //Metodo AJAX para mandar llamar un archivo PHP como backEnd
            $.ajax({
                //De donde se manda llamar
                url: 'servicio-search.php',
                //Metodo HTTP POST,GET
                type: 'POST',
                //Que se va a mandar
                data: { search },
                //Respuesta
                success: function(response) {
                    //Convertir String a formato JSON
                    let servicios = JSON.parse(response);
                    let template = '';
                    //Recibir los diferentes servicios en una lista
                    servicios.forEach(servicio => {
                        template += `<li>
                            ${servicio.nombre}
                        </li>`
                    });
                    //Indicarle donde se van a mandar los resultados
                    $('#servicios-result').html(template);
                    //Mostrar contenedor de resultados 
                    $('#servicios-result').show();
                }
            })
        }
    })


    $('#servicio-form').submit(e => {
        e.preventDefault();
        //Guardar los datos provenientes de los id
        const postData = {
            nombre: $('#nombre').val(),
            descripcion: $('#descripcion').val(),
            id: $('#servicioId').val(),
            activo: $('#activo').val(),
        };
        //Con edit se identifica si el servicio fue llmado desde el CRUD para su edicion
        //Si el valor de edid es True se va a servicios-edit y si es false se va a servicios-add
        const url = edit === false ? 'servicios-add.php' : 'servicios-edit.php';
        $.post(url, postData, (response) => {
            console.log(response);
            //Refrescar el form
            $('#servicio-form').trigger('reset');
            //Llamar funcion de mostrar en crud
            fetchServicios();
        });
    });
    // Fetching servicios
    function fetchServicios() {
        $.ajax({
            url: 'servicios-list.php',
            //Metodo para obtener informacion
            type: 'GET',
            success: function(response) {
                const servicios = JSON.parse(response);
                //Este es el objeto que recibira la forma en que se iran guardando los datos
                //para despues solo mandarlos al html
                let template = '';
                //forEach para ir guardando todos los registros
                servicios.forEach(servicio => {
                    template += `
                      <tr servicioId="${servicio.id}">
                      <td>${servicio.id}</td>
                      <td>
                      <a href="#" class="servicio-item">
                        ${servicio.nombre} 
                      </a>
                      </td>
                      <td>${servicio.descripcion}</td>
                      <td>${servicio.activo}</td>
                      <td>
                        <button class="servicio-delete btn btn-danger">
                         Delete 
                        </button>
                      </td>
                      </tr>
                    `
                });
                $('#servicios').html(template);
            }
        });
    }
    // Get servicio por ID para selecionarlos en el form
    $(document).on('click', '.servicio-item', (e) => {
        const element = $(this)[0].activeElement.parentElement.parentElement;
        const id = $(element).attr('servicioId');
        $.post('servicio-single.php', { id }, (response) => {
            const servicio = JSON.parse(response);
            $('#nombre').val(servicio.nombre);
            $('#descripcion').val(servicio.descripcion);
            $('#servicioId').val(servicio.id);
            $('#activo').val(servicio.activo);
            edit = true;
        });
        e.preventDefault();
    });

    // Delete un servicio
    $(document).on('click', '.servicio-delete', (e) => {
        if (confirm('¿Relmente quieres borrar el servicio?')) {
            const element = $(this)[0].activeElement.parentElement.parentElement;
            const id = $(element).attr('servicioId');
            $.post('servicios-delete.php', { id }, (response) => {
                fetchServicios();
            });
        }
    });
});