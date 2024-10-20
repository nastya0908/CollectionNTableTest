
import UIKit

final class TableCell: UITableViewCell {
    
    static let identifier = "TableCell"

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .customGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    private func setUp() {
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .customPink

        contentView.addSubview(label)
        contentView.addSubview(image)
        
        [label, image].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),

            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            image.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 5),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

        ])
    }
    
    func configure(with cellModel: CellModel) {
        setUp()
        label.text = cellModel.title
        image.image = cellModel.image
    }
}
