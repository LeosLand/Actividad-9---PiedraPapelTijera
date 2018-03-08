//
//  ViewController2.swift
//  PiedraPapelTijera
//
//  Created by Alumno IDS on 06/03/18.
//  Copyright © 2018 Alumno IDS. All rights reserved.
//
import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        setupViews()
    }

//Se crea la vista del contenedor donde tendremos nuestros resultados:
    let inputContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
//Se crea la vista del texto para colocar lo que la computadora escogia:
    let ComputadoraTextField : UITextField = {
     let textField = UITextField()
     textField.translatesAutoresizingMaskIntoConstraints = false
     return textField
     }()
    
//Se crea la vista del texto para colocar lo que el jugador escogio:
    let JugadorTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
//Se crea la vista del texto para colocar el resultado final:
    let ResultadoTextField : UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
//Se crea el boton de de retorno, para regresar a la pagina principal que sera nuestro ViewController, con todas las especificaciones:
    let ReturnButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.green
        button.setTitle("Play Again?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()

//Esta funcion hace que al momento de hacer clic en el boton lo regrese a la pagina principal (ViewController)
    @objc func handleLoginRegister(){
        self.dismiss(animated: true, completion: nil)
    }
    
//Se crean las vistas para los tres textos donde generaremos el resultado y el boton de retorno:
    func setupViews(){
        //add views
        view.addSubview(inputContainerView)
        inputContainerView.addSubview(ComputadoraTextField)
        inputContainerView.addSubview(JugadorTextField)
        inputContainerView.addSubview(ResultadoTextField)
        view.addSubview(ReturnButton)

//Se creas la vista del contenedor en donde estaran los TextField:
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
//Se creas la vista del Primer TextField:
        ComputadoraTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        ComputadoraTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        ComputadoraTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        ComputadoraTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
//Se creas la vista del Segundo TextField:
        JugadorTextField.topAnchor.constraint(equalTo: ComputadoraTextField.bottomAnchor).isActive = true
        JugadorTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        JugadorTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        JugadorTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
//Se creas la vista del Tercer Piedra:
        ResultadoTextField.topAnchor.constraint(equalTo: JugadorTextField.bottomAnchor).isActive = true
        ResultadoTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        ResultadoTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        ResultadoTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
//Se creas la vista del boton para retornar al ViewController:
        ReturnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ReturnButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 15  ).isActive = true
        ReturnButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ReturnButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
    }
}
