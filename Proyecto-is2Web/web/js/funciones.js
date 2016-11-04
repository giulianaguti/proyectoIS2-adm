/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function login_admin() {
    var u = document.getElementById("codigo").value;
    var p = document.getElementById("clave").value;

    $.get("admin",
            {
                codigo: u,
                clave: p
            },
    function (data) {
        if (data === "true") {
            window.location.href = "inicio.jsp";
        } else {
            alert("¡Usuario o contraseña incorrecta!");
        }

    });
}

function getMensajes(){
    
    $.get("mensajes",function(data){
         $("#msj").append(data);
    });
}

//function reg_cub(cub,user){
//    $.get("ReservarCubiculo",
//            {
//                cod: user,
//                cub: cub
//            },
//    function (data) {
//        if (data === "true") {
//            alert("¡Cubículo reservado!");
//            location.reload();
//        } else {
//            alert("¡Ocurrió un error!");
//        }
//
//    });
//}

function reg_pc(pc,user){
    $.get("ReservarPc",
            {
                cod: user,
                pc: pc
            },
    function (data) {
        if (data === "true") {
            alert("¡Pc reservada!");
            location.reload();
        } else {
            alert("¡Ocurrió un error!");
        }

    });
}

