
import UIKit

final class CollectionCell: UICollectionViewCell {
    
    static let identifier = "CollectionCell"
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .customGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func setUp() {
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .customPink
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        
        [label, imageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 35),

            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

        ])
    }
    
    func configure(with cellModel: CellModel) {
        setUp()
        label.text = cellModel.title
        imageView.image = cellModel.image
    }
}
