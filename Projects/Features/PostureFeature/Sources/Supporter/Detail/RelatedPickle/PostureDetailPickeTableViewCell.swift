import UIKit

import SnapKit
import Then

import DSKit
import Core
import Domain

import MGNetworks

public class PostureDetailPickeTableViewCell: BaseTableViewCell {

    static let identifier: String = PostureResourcesService.Identifier.postureDetailPickeTableViewCell

    private var pickleColellectionView: UICollectionView!

    private let titleLabel = UILabel().then {
        $0.text = PostureResourcesService.Title.relatedPickleTitle
        $0.textColor = .black
        $0.font = UIFont.Pretendard.titleMedium
        $0.textAlignment = .left
    }
    
    var pickleData: [PostureDetailPickleImageModel] = [] {
        didSet {
            pickleColellectionView.reloadData()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 6
            $0.minimumInteritemSpacing = 6
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 6)
        }

        pickleColellectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.register(PostureDetailPickleCollectionViewCell.self,
                        forCellWithReuseIdentifier: PostureDetailPickleCollectionViewCell.identifier)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.dataSource = self
            $0.delegate = self
            $0.backgroundColor = .white
        }
        addViews()
        setupViews()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(pickleColellectionView)
    }

    private func setupViews() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.width.equalToSuperview()
            $0.height.equalTo(32.0)
        }

        pickleColellectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().offset(20.0)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

public extension PostureDetailPickeTableViewCell {
    func setup(with model: PostureDetailPickleModel) {
        titleLabel.text = model.titleText
        pickleData = model.pickleImage
    }
}

extension PostureDetailPickeTableViewCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 126.0, height: 224.0)
    }
}

extension PostureDetailPickeTableViewCell: UICollectionViewDelegate {
    public func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        _ = pickleData[indexPath.row]
    }
}

extension PostureDetailPickeTableViewCell: UICollectionViewDataSource {
    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return pickleData.count
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PostureDetailPickleCollectionViewCell.identifier,
            for: indexPath
        ) as? PostureDetailPickleCollectionViewCell
        let model = pickleData[indexPath.row]
        cell?.setup(image: model.image)
        return cell ?? UICollectionViewCell()
    }
}
