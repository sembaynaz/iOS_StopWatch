//
//  ViewController.swift
//  iOS_StopWatch
//
//  Created by Nazerke Sembay on 20.08.2023.
//

import UIKit

class ViewController: UIViewController {
    let mainSV = UIStackView()
    let imageSegmentSV = UIStackView()
    let buttonsSV = UIStackView()
    let stackLabelSV = UIStackView()
    let playButton = UIButton()
    let pauseButton = UIButton()
    let stopButton = UIButton()
    let imageBackgroundView = UIView()
    let imageView = UIImageView()
    let segmentBackgroundView = UIView()
    let segmentControl = UISegmentedControl()
    let timeLabel = UILabel()
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        configureMainSV()
    }
}

extension ViewController {
        //MARK: UI Elements and contraints
    func configureMainSV() {
        //UI
        view.addSubview(mainSV)
        mainSV.axis = .vertical
        mainSV.spacing = 100
        
        configureImageSegmentSV()
        configureButtonsSV()
        configureLabel()
        
            //Constraints
        mainSV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainSV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainSV.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureImageSegmentSV() {
        //UI
        mainSV.addArrangedSubview(imageSegmentSV)
        imageSegmentSV.addArrangedSubview(imageBackgroundView)
        imageSegmentSV.addArrangedSubview(segmentBackgroundView)
        imageSegmentSV.addArrangedSubview(timeLabel)
        imageBackgroundView.addSubview(imageView)
        
        imageSegmentSV.axis = .vertical
        imageSegmentSV.spacing = 10
        
        imageView.image = UIImage(systemName: "timer")
        imageView.tintColor = .black
        
        segmentBackgroundView.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.insertSegment(withTitle: "Timer", at: 0, animated: false)
        segmentControl.insertSegment(withTitle: "Stopwatch", at: 1, animated: false)
        segmentControl.selectedSegmentIndex = 0
        
        //Constraints
        imageSegmentSV.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        imageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageSegmentSV.centerXAnchor.constraint(equalTo: mainSV.centerXAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.centerXAnchor.constraint(equalTo: imageBackgroundView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageBackgroundView.centerYAnchor),
            
            segmentControl.centerXAnchor.constraint(equalTo: segmentBackgroundView.centerXAnchor),
            
            imageBackgroundView.heightAnchor.constraint(equalToConstant: 60),
            imageBackgroundView.leadingAnchor.constraint(equalTo: imageSegmentSV.leadingAnchor, constant: 0),
            imageBackgroundView.trailingAnchor.constraint(equalTo: imageSegmentSV.trailingAnchor, constant: -0),
            
            segmentBackgroundView.heightAnchor.constraint(equalToConstant: 31),
            segmentBackgroundView.leadingAnchor.constraint(equalTo: imageBackgroundView.leadingAnchor, constant: 0),
            segmentBackgroundView.trailingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: -0)
        ])
    }
    
    func configureLabel() {
        //UI
        timeLabel.text = "00:00:00"
        timeLabel.font = UIFont.boldSystemFont(ofSize: 47)
        timeLabel.textAlignment = .center
        
        //Constraints
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: mainSV.centerXAnchor)
        ])
    }
    
    func configureButtonsSV() {
        //UI
        mainSV.addArrangedSubview(buttonsSV)
        buttonsSV.addArrangedSubview(stopButton)
        buttonsSV.addArrangedSubview(pauseButton)
        buttonsSV.addArrangedSubview(playButton)
        
        buttonsSV.axis = .horizontal
        buttonsSV.spacing = 47
        
        stopButton.setBackgroundImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
        stopButton.tintColor = .black
        pauseButton.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        pauseButton.tintColor = .black
        playButton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        playButton.tintColor = .black
        
        //Constraints
        buttonsSV.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playButton.widthAnchor.constraint(equalToConstant: 55),
            playButton.heightAnchor.constraint(equalToConstant: 58),
            
            pauseButton.widthAnchor.constraint(equalToConstant: 55),
            pauseButton.heightAnchor.constraint(equalToConstant: 58),
            
            stopButton.widthAnchor.constraint(equalToConstant: 55),
            stopButton.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
}

