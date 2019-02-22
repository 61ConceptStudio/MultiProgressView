//
//  OtherExampleViewController.swift
//  MultiProgressView_Example
//
//  Created by Mac Gallagher on 2/18/19.
//  Copyright © 2019 Mac Gallagher. All rights reserved.
//

import MultiProgressView

class OtherExampleViewController: UIViewController {
    
    private lazy var progressView: MultiProgressView = {
        let progress = MultiProgressView()
        progress.backgroundColor = .lightGray
        progress.trackInset = 5
        progress.trackBackgroundColor = .progressBackground
        progress.trackTitleAlignment = .center
        progress.lineCap = .round
        progress.cornerRadius = progressViewHeight / 2
        progress.setTitle("Background Title")
        progress.trackTitleLabel?.textColor = .lightGray
        return progress
    }()
    
    private let animateButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 1
        button.setTitle("Animate", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.tag = 2
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    private let padding: CGFloat = 15
    private let progressViewHeight: CGFloat = 60
    
    private let totalSteps: Int = 50
    private var currentSteps: [Int: Int] = [:]
    
    private var timer0 = Timer()
    private var timer1 = Timer()
    private var timer2 = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
        setupProgressBar()
        setupButtons()
    }
    
    private func setupProgressBar() {
        view.addSubview(progressView)
        progressView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: padding + 50, paddingLeft: padding, paddingRight: padding, height: progressViewHeight)
        progressView.dataSource = self
    }
    
    @objc private func handleTap(_ button: UIButton) {
        if button.tag == 1 {
            animateProgress()
        } else if button.tag == 2 {
            resetProgress()
        }
    }
    
    private func animateProgress() {
//        timer0 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(animateSection(section: 0, steps: 1)), userInfo: nil, repeats: true)
        UIView.animate(withDuration: 1.0) {
            self.progressView.setProgress(section: 0, to: 0.3)
            self.progressView.setProgress(section: 1, to: 0.3)
            self.progressView.setProgress(section: 2, to: 0.3)
        }
    }
    
    @objc private func animateSection(section: Int, steps: Int) {
        currentSteps[section] = (currentSteps[section] ?? 0) + steps
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 100, animations: {
            let progress: Float = Float(self.currentSteps[section] ?? 0) / Float(self.totalSteps)
            self.progressView.setProgress(section: section, to: progress)
        }, completion: nil)
    }
    
    private func resetProgress() {
        UIView.animate(withDuration: 0.1) {
            self.progressView.resetProgress()
        }
    }
    
    private func setupButtons() {
        view.addSubview(resetButton)
        resetButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 50, width: 200, height: 50)
        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(animateButton)
        animateButton.anchor(bottom: resetButton.topAnchor, paddingBottom: 20, width: 200, height: 50)
        animateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension OtherExampleViewController: MultiProgressViewDataSource {
    public func numberOfSections(in progressBar: MultiProgressView) -> Int {
        return 3
    }
    
    public func progressView(_ progressView: MultiProgressView, viewForSection section: Int) -> ProgressViewSection {
        let bar = ProgressViewSection()
        //use another color scheme
        switch section {
        case 0:
            bar.backgroundColor = .pacificBlue
        case 1:
            bar.backgroundColor = .appleGreen
        case 2:
            bar.backgroundColor = .cherryRed
        default:
            break
        }
        return bar
    }
}
