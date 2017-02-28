$(document).ready(function(){

$("#nuevo_tramite").click(function(){
	$("#buscar_tramite_content").removeClass('visible');
                //// cambiamos su estado
    $("#buscar_tramite_content").addClass('hidden');
                //// animamos
    $("#mostrar_tramite_detalle").removeClass('visible');
                //// cambiamos su estado
    $("#mostrar_tramite_detalle").addClass('hidden');
                //// animamos
    $("#borrar").removeClass('visible');
                //// cambiamos su estado
    $("#borrar").addClass('hidden');
                //// animamos
    $("#tramite_atr").removeClass('hidden');
                //// cambiamos su estado
    $("#tramite_atr").addClass('visible');
    
});

$("#editar_tramite").click(function(){
    $("#tramite_atr").removeClass('visible');
                //// cambiamos su estado
    $("#tramite_atr").addClass('hidden');

	$("#Tramite_Detalles").removeClass('hidden');
                //// cambiamos su estado
    $("#Tramite_Detalles").addClass('visible');
                //// animamos
    $("#buscar_tramite_content").removeClass('hidden');
                //// cambiamos su estado
    $("#buscar_tramite_content").addClass('visible');
                //// animamos
    $("#borrar").removeClass('hidden');
                //// cambiamos su estado
    $("#borrar").addClass('visible');
                //// animamos
    $("#mostrar_tramite_detalle").removeClass('visible');
                //// cambiamos su estado
    $("#mostrar_tramite_detalle").addClass('hidden');
});
$(".items_list").click(function(){
    $("#mostrar_tramite_detalle").removeClass('hidden');
                //// cambiamos su estado
    $("#mostrar_tramite_detalle").addClass('visible');

});
$(".item_tramite_detalle").click(function(){
    $("#p_detalles").removeClass('hidden');
                //// cambiamos su estado
    $("#p_detalles").addClass('visible');

});
$(".item_move_tramite").click(function(){
    $("#mover_tramite_visible").removeClass('hidden');
                //// cambiamos su estado
    $("#mover_tramite_visible").addClass('visible');

});

}); 