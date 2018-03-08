//
//  ViewController.swift
//  PiedraPapelTijera
//
//  Created by Alumno IDS on 06/03/18.
//  Copyright © 2018 Alumno IDS. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
//Se instancian las variables que se utilizaran durante todo el programa:
    var piedra = 0, papel = 1, tijera = 2
    var CPU:String?
    var Jugador1:String?
    var Ganador:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//Se crea el boton de piedra, con todas las especificaciones:
    let PiedraButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.blue
        button.setTitle("Piedra", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(RandomPiedra), for: .touchUpInside)
        return button
    }()
    
//Se crea el boton de papel, con todas las especificaciones:
    let PapelButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.green
        button.setTitle("Papel", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(RandomPapel), for: .touchUpInside)
        return button
    }()
    
//Se crea el boton de tijera, con todas las especificaciones:
    let TijeraButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.red
        button.setTitle("Tijera", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(RandomTijera), for: .touchUpInside)
        return button
    }()
    
//Se genera la funcion para cuando se le de clic en el boton piedra, genere el resultado con las especificaciones requeridas:
    @objc func RandomPiedra(){
        let Random = arc4random_uniform(3)
        if Random == UInt32(piedra){
            CPU = "Piedra"
            Jugador1 = "Piedra"
            Ganador = "Empate"}
        else if Random == UInt32(papel) {
            CPU = "Papel"
            Jugador1 = "Piedra"
            Ganador = "Pierdes"}
        else if Random == UInt32(tijera) {
            CPU = "Tijera"
            Jugador1 = "Piedra"
            Ganador = "Ganaste"}
        Resultado()
    }
    
//Se genera la funcion para cuando se le de clic en el boton papel, genere el resultado con las especificaciones requeridas:
    @objc func RandomPapel(){
        var Random = arc4random_uniform(3)
        if Random == UInt32(piedra){
            CPU = "Piedra"
            Jugador1 = "Papel"
            Ganador = "Ganaste"}
        else if Random == UInt32(papel) {
            CPU = "Papel"
            Jugador1 = "Papel"
            Ganador = "Empate"}
        else if Random == UInt32(tijera) {
            CPU = "Tijera"
            Jugador1 = "Papel"
            Ganador = "Pierdes"}
        Resultado()
    }
    
//Se genera la funcion para cuando se le de clic en el boton tijera, genere el resultado con las especificaciones requeridas:
    @objc func RandomTijera(){
        var Random = arc4random_uniform(3)
        if Random == UInt32(piedra){
            CPU = "Piedra"
            Jugador1 = "Tijera"
            Ganador = "Pierdes"}
        else if Random == UInt32(papel) {
            CPU = "Papel"
            Jugador1 = "Tijera"
            Ganador = "Ganaste"}
        else if Random == UInt32(tijera) {
            CPU = "Tijera"
            Jugador1 = "Tijera"
            Ganador = "Empate"}
        Resultado()
    }
    
//Se crean las vistas para los tres botones
    func setupViews(){
        //add views
        view.addSubview(PiedraButton)
        view.addSubview(PapelButton)
        view.addSubview(TijeraButton)
        
//Se creas la vista del boton Piedra:
        PiedraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        PiedraButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        PiedraButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -350).isActive = true
        PiedraButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
//Se creas la vista del boton Papel:
        PapelButton.topAnchor.constraint(equalTo: PiedraButton.bottomAnchor,constant: 10).isActive = true
        PapelButton.widthAnchor.constraint(equalTo: PiedraButton.widthAnchor).isActive = true
        PapelButton.leftAnchor.constraint(equalTo: PiedraButton.leftAnchor).isActive = true
        PapelButton.heightAnchor.constraint(equalTo: PiedraButton.heightAnchor).isActive = true
        
//Se creas la vista del boton Tijera:
        TijeraButton.topAnchor.constraint(equalTo: PapelButton.bottomAnchor,constant: 10).isActive = true
        TijeraButton.widthAnchor.constraint(equalTo: PapelButton.widthAnchor).isActive = true
        TijeraButton.leftAnchor.constraint(equalTo: PapelButton.leftAnchor).isActive = true
        TijeraButton.heightAnchor.constraint(equalTo: PapelButton.heightAnchor).isActive = true
    }
    
//Esta funcion genera que la ventana sea llamada y la traslada al viewController2:
    func Resultado(){
        var viewController2: ViewController2 = ViewController2()
        viewController2.ComputadoraTextField.text = "CPU: " + CPU!
        viewController2.JugadorTextField.text = "Jugador: " + Jugador1!
        viewController2.ResultadoTextField.text = Ganador!
        present(viewController2, animated: true, completion: nil)
    }
}

