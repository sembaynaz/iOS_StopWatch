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
    let pickerBackgroundView = UIView()
    let imageView = UIImageView()
    let segmentBackgroundView = UIView()
    let segmentControl = UISegmentedControl()
    let timeLabel = UILabel()
    let datePicker = UIDatePicker()
    let pickerView = UIPickerView()
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    var time = 0
    var startTime = 0
    var timer = Timer()
    var isTimerRunning = false
    var counter = 1
    var currentTime = 0
    var timeInSeconds = 0
    var playButtonTouched = false
    var pauseButtonTouched = false
    var stopButtonTouched = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        pickerView.isHidden = true
        configureMainSV()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
}

extension ViewController {
    //MARK: UI Elements and contraints
    func configureMainSV() {
            //UI
        view.addSubview(mainSV)
        mainSV.axis = .vertical
        mainSV.spacing = 30
        
        configureImageSegmentSV()
        configureLabel()
        configurePickerView()
        configureButtonsSV()
        
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
        segmentControl.addTarget(self, action: #selector(segmentTouched), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(clean), for: .valueChanged)
        
        //Constraints
        imageSegmentSV.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        imageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.translatesAutoresizingMaskIntoConstraints = false

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
        mainSV.addArrangedSubview(timeLabel)
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
        
        stopButton.tintColor = .black
        stopButton.addTarget(self, action: #selector(stop), for: .touchDown)
        pauseButton.tintColor = .black
        pauseButton.addTarget(self, action: #selector(pause), for: .touchDown)
        playButton.tintColor = .black
        playButton.addTarget(self, action: #selector(play), for: .touchDown)
        setImagesForButtons()
        
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
    
    func configurePickerView() {
        //UI
        mainSV.addArrangedSubview(pickerBackgroundView)
        pickerBackgroundView.addSubview(pickerView)
        
        //Constraints
        pickerBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerBackgroundView.trailingAnchor.constraint(equalTo: mainSV.trailingAnchor, constant: 0),
            pickerBackgroundView.leadingAnchor.constraint(equalTo: mainSV.leadingAnchor, constant: 0),
            pickerBackgroundView.heightAnchor.constraint(equalToConstant: 200),
            
            pickerView.centerXAnchor.constraint(equalTo: pickerBackgroundView.centerXAnchor),
            pickerView.trailingAnchor.constraint(equalTo: pickerBackgroundView.trailingAnchor, constant: 0),
            pickerView.leadingAnchor.constraint(equalTo: pickerBackgroundView.leadingAnchor, constant: 0),
        ])
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? 24 : 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%02d", row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hours = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break
        }
        
        let formattedString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        timeInSeconds = hours * 3600 + minutes * 60 + seconds
        timeLabel.text = formattedString //String(timeInSeconds)
        print(formattedString)
    }
}

extension ViewController {
    //segment function
    @objc func segmentTouched(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            if isTimerRunning {
                clean()
            }
            pickerView.isHidden = true
            counter = 1
        } else if sender.selectedSegmentIndex == 1{
            if isTimerRunning {
                clean()
            }
            pickerView.isHidden = false
            counter = 2
        }
    }
    
    //MARK: Functions timer
    
    //func clean
    @objc func clean(){
        timer.invalidate()
        time = 0
        currentTime = 0
        timeLabel.text = timeToString(intTime: time)
        isTimerRunning = false
        timeInSeconds = 0
        stopButtonTouched = false
        playButtonTouched = false
        pauseButtonTouched = false
        setImagesForButtons()
        if counter == 2 {
            showPickerView()
        }
    }
    //func time to string
    func timeToString(intTime: Int) -> String{
        let seconds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        return String(format: "%0.2d:%0.2d:%0.2d", hours,minutes,seconds)
    }
    
    //func stop button
    @objc func stop() {
        stopButtonTouched = true
        playButtonTouched = false
        pauseButtonTouched = false
        setImagesForButtons()
        
        clean()
    }
    
    //func play button
    @objc func play() {
        stopButtonTouched = false
        playButtonTouched = true
        pauseButtonTouched = false
        setImagesForButtons()
        
        if isTimerRunning{
            return
        }
        //timer
        if counter == 1 {
            time = 0
            if currentTime != 0 {
                time = currentTime
            }
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
            
        }
        //stopwatch
        else if counter == 2 {
            time = timeInSeconds
            if currentTime != 0 {
                time = currentTime
                
            }
            if time == 0 {
                timer.invalidate()
                return
            }
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countStopWatch), userInfo: nil, repeats: true)
            timeInSeconds = 0
        }
        isTimerRunning = true
    }
    
    //timer function
    @objc func countTimer(){
        time += 1
        timeLabel.text = timeToString(intTime: time)
    }
    
    //stopwatch function
    @objc func countStopWatch() {
        time -= 1
        timeLabel.text = timeToString(intTime: time)
        pickerView.isHidden = true
        
        if time == 0 {
            showPickerView()
            timer.invalidate()
            isTimerRunning = false
            currentTime = 0
        }
    }
    
    @objc func pause() {
        stopButtonTouched = false
        playButtonTouched = false
        pauseButtonTouched = true
        setImagesForButtons()
        currentTime = time
        print(currentTime)
        timer.invalidate()
        isTimerRunning = false
    }
    
    func showPickerView() {
        for component in 0..<self.pickerView.numberOfComponents {
            self.pickerView.selectRow(0, inComponent: component, animated: false)
            self.pickerView.reloadComponent(component)
        }
        pickerView.isHidden = false
    }
    
    func setImagesForButtons() {
        if !playButtonTouched && !stopButtonTouched && !pauseButtonTouched {
            playButton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            pauseButton.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            stopButton.setBackgroundImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
        }
        
        if playButtonTouched {
            playButton.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
            pauseButton.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            stopButton.setBackgroundImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
        }
        
        if pauseButtonTouched {
            playButton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            pauseButton.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
            stopButton.setBackgroundImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
        }
        
        if stopButtonTouched {
            playButton.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            pauseButton.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            stopButton.setBackgroundImage(UIImage(systemName: "stop.circle"), for: .normal)
        }
    }
}
