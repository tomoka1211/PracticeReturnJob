//
//  PickerView.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

final class PickerView: UIView {
    
    // MARK: - Outlet
    
    @IBOutlet private weak var pickerLabel: PickerLabel!
    @IBOutlet private weak var arrowImage: UIImageView!
    
    // MARK: - Property
    
    private let disposeBag = DisposeBag()
    
    internal var data: [(String, Int)] = [] {
        didSet {
            pickerLabel.data = data
        }
    }
    
    internal var selectedItem: PublishRelay<Int> = PublishRelay()
    
    private let coverView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    // MARK: - Initialize
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
        setLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        setLayout()
    }
    
    // MARK: - Private
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }
    
    private func setLayout() {
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
        self.borders(for: [.all], width: 1, color: UIColor.gray)
        
        coverView.rx.tapGes
            .subscribe(onNext: { [unowned self] _ in
                self.pickerLabel.resignFirstResponder()
                coverView.isHidden = true
            }).disposed(by: disposeBag)
        
        self.pickerLabel.selected
            .drive(onNext: { [unowned self] index in
                self.selectedItem.accept(index)
            })
            .disposed(by: disposeBag)
        
        Observable.merge(
            self.pickerLabel.rx.didTapDone,
            self.pickerLabel.rx.didTapCancel
        )
        .subscribe(onNext: { [unowned self] _ in
            self.coverView.isHidden = true
        })
        .disposed(by: disposeBag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.touchesBegan(touches, with: event)
        pickerLabel.becomeFirstResponder()
        
        if let parentVC = self.parentViewController() {
            parentVC.view.addSubview(coverView)
            coverView.translatesAutoresizingMaskIntoConstraints = false
            coverView.trailingAnchor.constraint(equalTo: parentVC.view.trailingAnchor).isActive = true
            coverView.leadingAnchor.constraint(equalTo: parentVC.view.leadingAnchor).isActive = true
            coverView.bottomAnchor.constraint(equalTo: parentVC.view.bottomAnchor).isActive = true
            coverView.topAnchor.constraint(equalTo: parentVC.view.topAnchor).isActive = true
            coverView.isHidden = false
        }
    }
}
