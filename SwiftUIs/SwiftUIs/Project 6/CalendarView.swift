//
//  CalendarView.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/4/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import Foundation
import SwiftUI

struct CalendarView: UIViewControllerRepresentable {
    @Binding var selectedDate: Date
    @Binding var closeView: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var dimmedBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var headerView = CalendarPickerHeaderView(exitButtonTappedCompletionHandler: {
        print("I'm closed")
    })
//    { [weak self] in
//        guard let self = self else { return }
//
//        self.dismiss(animated: true)
//    }
    
     var footerView = CalendarPickerFooterView(
        didTapLastMonthCompletionHandler: {
            print("This is the last month")
        },
        didTapNextMonthCompletionHandler: {
            print("Go to next")
    })
    
    // MARK: Calendar Data Values
    
    var baseDate: Date {
        didSet {
            days = generateDaysInMonth(for: baseDate)
            collectionView.reloadData()
            headerView.baseDate = baseDate
        }
    }
    
    lazy var days = generateDaysInMonth(for: baseDate)
    
    var numberOfWeeksInBaseDate: Int {
        calendar.range(of: .weekOfMonth, in: .month, for: baseDate)?.count ?? 0
    }
    
    let selectedDateChanged: ((Date) -> Void)
    let calendar = Calendar(identifier: .gregorian)
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter
    }()
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        let viewController = UIViewController()
        collectionView.backgroundColor = .systemGroupedBackground
        viewController.view.addSubview(dimmedBackgroundView)
        viewController.view.addSubview(collectionView)
        viewController.view.addSubview(headerView)
        viewController.view.addSubview(footerView)
        
        var constraints = [
            dimmedBackgroundView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            dimmedBackgroundView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            dimmedBackgroundView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            dimmedBackgroundView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
        ]
        
        constraints.append(contentsOf: [
            //1
            collectionView.leadingAnchor.constraint(
                equalTo: viewController.view.readableContentGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(
                equalTo: viewController.view.readableContentGuide.trailingAnchor),
            //2
            collectionView.centerYAnchor.constraint(
                equalTo: viewController.view.centerYAnchor,
                constant: 10),
            //3
            collectionView.heightAnchor.constraint(
                equalTo: viewController.view.heightAnchor,
                multiplier: 0.5)
        ])
        
        constraints.append(contentsOf: [
            headerView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 85),
            
            footerView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            footerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate(constraints)
        
        collectionView.register(
            CalendarDateCollectionViewCell.self,
            forCellWithReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier
        )
        
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        headerView.baseDate = baseDate
        
        
        
        return viewController
    }
    
//    init(baseDate: Date, selectedDateChanged: @escaping ((Date) -> Void)) {
//        self.selectedDate = baseDate
//        self.baseDate = baseDate
//        self.selectedDateChanged = selectedDateChanged
//    }
    
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        var parent: CalendarView
        
        
        init(_ parent: CalendarView) {
            self.parent = parent
        }
        
        func collectionView(
          _ collectionView: UICollectionView,
          numberOfItemsInSection section: Int
        ) -> Int {
            parent.days.count
        }

        func collectionView(
          _ collectionView: UICollectionView,
          cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
            let day = parent.days[indexPath.row]

          let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarDateCollectionViewCell.reuseIdentifier,
            for: indexPath) as! CalendarDateCollectionViewCell
          // swiftlint:disable:previous force_cast

          cell.day = day
          return cell
        }
        
        func collectionView(
          _ collectionView: UICollectionView,
          didSelectItemAt indexPath: IndexPath
        ) {
            let day = parent.days[indexPath.row]
            parent.selectedDateChanged(day.date)
            parent.presentationMode.wrappedValue.dismiss()
        }

        func collectionView(
          _ collectionView: UICollectionView,
          layout collectionViewLayout: UICollectionViewLayout,
          sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
          let width = Int(collectionView.frame.width / 7)
            let height = Int(collectionView.frame.height) / parent.numberOfWeeksInBaseDate
          return CGSize(width: width, height: height)
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}


// MARK: - Day Generation
extension CalendarView {
    // 1
    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
        // 2
        guard
            let numberOfDaysInMonth = calendar.range(
                of: .day,
                in: .month,
                for: baseDate)?.count,
            let firstDayOfMonth = calendar.date(
                from: calendar.dateComponents([.year, .month], from: baseDate))
            else {
                // 3
                throw CalendarDataError.metadataGeneration
        }
        
        // 4
        let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        
        // 5
        return MonthMetadata(
            numberOfDays: numberOfDaysInMonth,
            firstDay: firstDayOfMonth,
            firstDayWeekday: firstDayWeekday)
    }
    
    // 1
    mutating func generateDaysInMonth(for baseDate: Date) -> [Day] {
        // 2
        guard let metadata = try? monthMetadata(for: baseDate) else {
            preconditionFailure("An error occurred when generating the metadata for \(baseDate)")
        }
        
        let numberOfDaysInMonth = metadata.numberOfDays
        let offsetInInitialRow = metadata.firstDayWeekday
        let firstDayOfMonth = metadata.firstDay
        
        // 3
        var days: [Day] = (1..<(numberOfDaysInMonth + offsetInInitialRow))
            .map { day in
                // 4
                let isWithinDisplayedMonth = day >= offsetInInitialRow
                // 5
                let dayOffset =
                    isWithinDisplayedMonth ?
                        day - offsetInInitialRow :
                        -(offsetInInitialRow - day)
                
                // 6
                return generateDay(
                    offsetBy: dayOffset,
                    for: firstDayOfMonth,
                    isWithinDisplayedMonth: isWithinDisplayedMonth)
        }
        
        days += generateStartOfNextMonth(using: firstDayOfMonth)
        
        return days
    }
    
    // 7
    mutating func generateDay(
        offsetBy dayOffset: Int,
        for baseDate: Date,
        isWithinDisplayedMonth: Bool
    ) -> Day {
        let date = calendar.date(
            byAdding: .day,
            value: dayOffset,
            to: baseDate)
            ?? baseDate
        
        return Day(
            date: date,
            number: dateFormatter.string(from: date),
            isSelected: calendar.isDate(date, inSameDayAs: selectedDate),
            isWithinDisplayedMonth: isWithinDisplayedMonth
        )
    }
    
    // 1
    mutating func generateStartOfNextMonth(
        using firstDayOfDisplayedMonth: Date
    ) -> [Day] {
        // 2
        guard
            let lastDayInMonth = calendar.date(
                byAdding: DateComponents(month: 1, day: -1),
                to: firstDayOfDisplayedMonth)
            else {
                return []
        }
        
        // 3
        let additionalDays = 7 - calendar.component(.weekday, from: lastDayInMonth)
        guard additionalDays > 0 else {
            return []
        }
        
        // 4
        let days: [Day] = (1...additionalDays)
            .map {
                generateDay(
                    offsetBy: $0,
                    for: lastDayInMonth,
                    isWithinDisplayedMonth: false)
        }
        
        return days
    }
    
    enum CalendarDataError: Error {
        case metadataGeneration
    }
}




class CalendarPickerHeaderView: UIView {
    @Environment(\.presentationMode) var presentationMode
  lazy var monthLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 26, weight: .bold)
    label.text = "Month"
    label.accessibilityTraits = .header
    label.isAccessibilityElement = true
    return label
  }()

  lazy var closeButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false

    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: "xmark.circle.fill", withConfiguration: configuration)
    button.setImage(image, for: .normal)

    button.tintColor = .secondaryLabel
    button.contentMode = .scaleAspectFill
    button.isUserInteractionEnabled = true
    button.isAccessibilityElement = true
    button.accessibilityLabel = "Close Picker"
    return button
  }()

  lazy var dayOfWeekStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.distribution = .fillEqually
    return stackView
  }()

  lazy var separatorView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.label.withAlphaComponent(0.2)
    return view
  }()

  private lazy var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.locale = Locale.autoupdatingCurrent
    dateFormatter.setLocalizedDateFormatFromTemplate("MMMM y")
    return dateFormatter
  }()

  var baseDate = Date() {
    didSet {
      monthLabel.text = dateFormatter.string(from: baseDate)
    }
  }

  var exitButtonTappedCompletionHandler: (() -> Void)

  init(exitButtonTappedCompletionHandler: @escaping (() -> Void)) {
    self.exitButtonTappedCompletionHandler = exitButtonTappedCompletionHandler

    super.init(frame: CGRect.zero)

    translatesAutoresizingMaskIntoConstraints = false

    backgroundColor = .systemGroupedBackground

    layer.maskedCorners = [
      .layerMinXMinYCorner,
      .layerMaxXMinYCorner
    ]
    layer.cornerCurve = .continuous
    layer.cornerRadius = 15

    addSubview(monthLabel)
    addSubview(closeButton)
    addSubview(dayOfWeekStackView)
    addSubview(separatorView)

    for dayNumber in 1...7 {
      let dayLabel = UILabel()
      dayLabel.font = .systemFont(ofSize: 12, weight: .bold)
      dayLabel.textColor = .secondaryLabel
      dayLabel.textAlignment = .center
      dayLabel.text = dayOfWeekLetter(for: dayNumber)

      // VoiceOver users don't need to hear these days of the week read to them, nor do SwitchControl or Voice Control users need to select them
      // If fact, they get in the way!
      // When a VoiceOver user highlights a day of the month, the day of the week is read to them.
      // That method provides the same amount of context as this stack view does to visual users
      dayLabel.isAccessibilityElement = false
      dayOfWeekStackView.addArrangedSubview(dayLabel)
    }

    closeButton.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
  }

  @objc func didTapExitButton() {
    presentationMode.wrappedValue.dismiss()
    presentationMode.wrappedValue.dismiss()
    print("Yego")
    exitButtonTappedCompletionHandler()
    print("Yes")
  }
    

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func dayOfWeekLetter(for dayNumber: Int) -> String {
    switch dayNumber {
    case 1:
      return "S"
    case 2:
      return "M"
    case 3:
      return "T"
    case 4:
      return "W"
    case 5:
      return "T"
    case 6:
      return "F"
    case 7:
      return "S"
    default:
      return ""
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      monthLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
      monthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      monthLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: 5),

      closeButton.centerYAnchor.constraint(equalTo: monthLabel.centerYAnchor),
      closeButton.heightAnchor.constraint(equalToConstant: 28),
      closeButton.widthAnchor.constraint(equalToConstant: 28),
      closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

      dayOfWeekStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      dayOfWeekStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      dayOfWeekStackView.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -5),

      separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
      separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
      separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
      separatorView.heightAnchor.constraint(equalToConstant: 1)
    ])
  }
}



class CalendarPickerFooterView: UIView {
  lazy var separatorView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.label.withAlphaComponent(0.2)
    return view
  }()

  lazy var previousMonthButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
    button.titleLabel?.textAlignment = .left

    if let chevronImage = UIImage(systemName: "chevron.left.circle.fill") {
      let imageAttachment = NSTextAttachment(image: chevronImage)
      let attributedString = NSMutableAttributedString()

      attributedString.append(
        NSAttributedString(attachment: imageAttachment)
      )

      attributedString.append(
        NSAttributedString(string: " Previous")
      )

      button.setAttributedTitle(attributedString, for: .normal)
    } else {
      button.setTitle("Previous", for: .normal)
    }

    button.titleLabel?.textColor = .label

    button.addTarget(self, action: #selector(didTapPreviousMonthButton), for: .touchUpInside)
    return button
  }()

  lazy var nextMonthButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
    button.titleLabel?.textAlignment = .right

    if let chevronImage = UIImage(systemName: "chevron.right.circle.fill") {
      let imageAttachment = NSTextAttachment(image: chevronImage)
      let attributedString = NSMutableAttributedString(string: "Next ")

      attributedString.append(
        NSAttributedString(attachment: imageAttachment)
      )

      button.setAttributedTitle(attributedString, for: .normal)
    } else {
      button.setTitle("Next", for: .normal)
    }

    button.titleLabel?.textColor = .label

    button.addTarget(self, action: #selector(didTapNextMonthButton), for: .touchUpInside)
    return button
  }()

  let didTapLastMonthCompletionHandler: (() -> Void)
  let didTapNextMonthCompletionHandler: (() -> Void)

  init(
    didTapLastMonthCompletionHandler: @escaping (() -> Void),
    didTapNextMonthCompletionHandler: @escaping (() -> Void)
  ) {
    self.didTapLastMonthCompletionHandler = didTapLastMonthCompletionHandler
    self.didTapNextMonthCompletionHandler = didTapNextMonthCompletionHandler

    super.init(frame: CGRect.zero)

    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .systemGroupedBackground

    layer.maskedCorners = [
      .layerMinXMaxYCorner,
      .layerMaxXMaxYCorner
    ]
    layer.cornerCurve = .continuous
    layer.cornerRadius = 15

    addSubview(separatorView)
    addSubview(previousMonthButton)
    addSubview(nextMonthButton)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private var previousOrientation: UIDeviceOrientation = UIDevice.current.orientation

  override func layoutSubviews() {
    super.layoutSubviews()

    let smallDevice = UIScreen.main.bounds.width <= 350

    let fontPointSize: CGFloat = smallDevice ? 14 : 17

    previousMonthButton.titleLabel?.font = .systemFont(ofSize: fontPointSize, weight: .medium)
    nextMonthButton.titleLabel?.font = .systemFont(ofSize: fontPointSize, weight: .medium)

    NSLayoutConstraint.activate([
      separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
      separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
      separatorView.topAnchor.constraint(equalTo: topAnchor),
      separatorView.heightAnchor.constraint(equalToConstant: 1),

      previousMonthButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      previousMonthButton.centerYAnchor.constraint(equalTo: centerYAnchor),

      nextMonthButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      nextMonthButton.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }

  @objc func didTapPreviousMonthButton() {
    didTapLastMonthCompletionHandler()
  }

  @objc func didTapNextMonthButton() {
    didTapNextMonthCompletionHandler()
  }
}



class CalendarDateCollectionViewCell: UICollectionViewCell {
  private lazy var selectionBackgroundView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
    view.backgroundColor = .systemRed
    return view
  }()

  private lazy var numberLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    label.textColor = .label
    return label
  }()

  private lazy var accessibilityDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMMM d")
    return dateFormatter
  }()

  static let reuseIdentifier = String(describing: CalendarDateCollectionViewCell.self)

  var day: Day? {
    didSet {
      guard let day = day else { return }

      numberLabel.text = day.number
      accessibilityLabel = accessibilityDateFormatter.string(from: day.date)
      updateSelectionStatus()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    isAccessibilityElement = true
    accessibilityTraits = .button

    contentView.addSubview(selectionBackgroundView)
    contentView.addSubview(numberLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    // This allows for rotations and trait collection
    // changes (e.g. entering split view on iPad) to update constraints correctly.
    // Removing old constraints allows for new ones to be created
    // regardless of the values of the old ones
    NSLayoutConstraint.deactivate(selectionBackgroundView.constraints)

    // 1
    let size = traitCollection.horizontalSizeClass == .compact ?
      min(min(frame.width, frame.height) - 10, 60) : 45

    // 2
    NSLayoutConstraint.activate([
      numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

      selectionBackgroundView.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
      selectionBackgroundView.centerXAnchor.constraint(equalTo: numberLabel.centerXAnchor),
      selectionBackgroundView.widthAnchor.constraint(equalToConstant: size),
      selectionBackgroundView.heightAnchor.constraint(equalTo: selectionBackgroundView.widthAnchor)
    ])

    selectionBackgroundView.layer.cornerRadius = size / 2
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)

    layoutSubviews()
  }
}

// MARK: - Appearance
private extension CalendarDateCollectionViewCell {
  // 1
  func updateSelectionStatus() {
    guard let day = day else { return }

    if day.isSelected {
      applySelectedStyle()
    } else {
      applyDefaultStyle(isWithinDisplayedMonth: day.isWithinDisplayedMonth)
    }
  }

  // 2
  var isSmallScreenSize: Bool {
    let isCompact = traitCollection.horizontalSizeClass == .compact
    let smallWidth = UIScreen.main.bounds.width <= 350
    let widthGreaterThanHeight = UIScreen.main.bounds.width > UIScreen.main.bounds.height

    return isCompact && (smallWidth || widthGreaterThanHeight)
  }

  // 3
  func applySelectedStyle() {
    accessibilityTraits.insert(.selected)
    accessibilityHint = nil

    numberLabel.textColor = isSmallScreenSize ? .systemRed : .white
    selectionBackgroundView.isHidden = isSmallScreenSize
  }

  // 4
  func applyDefaultStyle(isWithinDisplayedMonth: Bool) {
    accessibilityTraits.remove(.selected)
    accessibilityHint = "Tap to select"

    numberLabel.textColor = isWithinDisplayedMonth ? .label : .secondaryLabel
    selectionBackgroundView.isHidden = true
  }
}

struct Day {
  // 1
  let date: Date
  // 2
  let number: String
  // 3
  let isSelected: Bool
  // 4
  let isWithinDisplayedMonth: Bool
}

struct MonthMetadata {
  let numberOfDays: Int
  let firstDay: Date
  let firstDayWeekday: Int
}
