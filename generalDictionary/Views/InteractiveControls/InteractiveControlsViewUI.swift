//
//  InteractiveControlsViewUI.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

protocol InteractiveControlsViewUIDelegate {
    
}

class InteractiveControlsViewUI: UIView{
    var delegate: InteractiveControlsViewUIDelegate?
    var navigationController: UINavigationController?
    private let pickerValues = ["uno", "dos", "tres", "cuatro", "cinco"]
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "En esta vista encontraras diversos controles con los que el usuario puede interactuar"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var infoPicker: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Picker"
        label.textColor = .black
        return label
    }()
    
    private lazy var Picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .lightGray
        return picker
    }()
    
    private lazy var infoPager: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Pager"
        label.textColor = .black
        return label
    }()
    
    private lazy var Pager: UIPageControl = {
        let pager = UIPageControl()
        pager.translatesAutoresizingMaskIntoConstraints = false
        pager.backgroundColor = .lightGray
        pager.numberOfPages = pickerValues.count
        pager.addTarget(self, action: #selector(myPageControlAction), for: .touchDown)
        return pager
    }()
    
    private lazy var infoSegmentedControl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Segmented Control"
        label.textColor = .black
        return label
    }()
    
    private lazy var SegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.removeAllSegments()
        for (index, value) in self.pickerValues.enumerated() {
            control.insertSegment(withTitle: value, at: index, animated: true)
        }
        control.backgroundColor = .gray
        control.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    private lazy var infoslider: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Slider"
        label.textColor = .black
        return label
    }()
    
    private var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .lightGray
        slider.minimumValue = 1
        slider.value = 1
        slider.addTarget(self, action: #selector(sliderControl(_:)), for: .valueChanged)
        return slider
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: InteractiveControlsViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            slider.maximumValue = Float(self.pickerValues.count)
            
            setUI()
            setConstraints()
        }
    @objc func sliderControl(_ sender: UISlider) {
        var progress: Float = 0
        switch slider.value {
        case 1..<2:
            SegmentedControl.selectedSegmentIndex = 0
            Picker.selectRow(0, inComponent: 0, animated: true)
            Pager.currentPage = 0
            progress = 0.2
        case 2..<3:
            SegmentedControl.selectedSegmentIndex = 1
            Picker.selectRow(1, inComponent: 0, animated: true)
            Pager.currentPage = 1
            progress = 0.4
        case 3..<4:
            SegmentedControl.selectedSegmentIndex = 2
            Picker.selectRow(2, inComponent: 0, animated: true)
            Pager.currentPage = 2
            progress = 0.6
        case 4..<5:
            SegmentedControl.selectedSegmentIndex = 3
            Picker.selectRow(3, inComponent: 0, animated: true)
            Pager.currentPage = 3
            progress = 0.8
        default:
            SegmentedControl.selectedSegmentIndex = 4
            Picker.selectRow(4, inComponent: 0, animated: true)
            Pager.currentPage = 4
            progress = 1
        }
    }
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        Picker.selectRow(SegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        Pager.currentPage = SegmentedControl.selectedSegmentIndex
        slider.value = Float(SegmentedControl.selectedSegmentIndex + 1)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.backgroundColor = .white
        self.addSubview(infoLabel)
        self.addSubview(scrollView)
        scrollView.addSubview(infoPicker)
        scrollView.addSubview(Picker)
        scrollView.addSubview(infoPager)
        scrollView.addSubview(Pager)
        scrollView.addSubview(infoSegmentedControl)
        scrollView.addSubview(SegmentedControl)
        scrollView.addSubview(infoslider)
        scrollView.addSubview(slider)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ///ScrollView
            scrollView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            infoPicker.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            infoPicker.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            infoPicker.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            infoPicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            Picker.topAnchor.constraint(equalTo: infoPicker.bottomAnchor, constant: 10),
            Picker.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            Picker.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            infoPager.topAnchor.constraint(equalTo: Picker.bottomAnchor, constant: 30),
            infoPager.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            infoPager.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            Pager.topAnchor.constraint(equalTo: infoPager.bottomAnchor, constant: 10),
            Pager.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            Pager.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            Pager.heightAnchor.constraint(equalToConstant: 100),
            
            infoSegmentedControl.topAnchor.constraint(equalTo: Pager.bottomAnchor, constant: 30),
            infoSegmentedControl.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            infoSegmentedControl.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            SegmentedControl.topAnchor.constraint(equalTo: infoSegmentedControl.bottomAnchor, constant: 10),
            SegmentedControl.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            SegmentedControl.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            SegmentedControl.heightAnchor.constraint(equalToConstant: 100),
            
            infoslider.topAnchor.constraint(equalTo: SegmentedControl.bottomAnchor, constant: 30),
            infoslider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            infoslider.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            slider.topAnchor.constraint(equalTo: infoslider.bottomAnchor, constant: 10),
            slider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            slider.heightAnchor.constraint(equalToConstant: 100),
            slider.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    @objc func myPageControlAction(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.Picker.selectRow(self.Pager.currentPage, inComponent: 0, animated: true)
            self.SegmentedControl.selectedSegmentIndex = self.Pager.currentPage
            self.slider.value = Float(self.Pager.currentPage + 1)
        })
    }
}
extension InteractiveControlsViewUI: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 5
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Pager.currentPage = row
        SegmentedControl.selectedSegmentIndex = row
        self.slider.value = Float(row + 1)
        return pickerValues[row]
    }
    
}
