module ApplicationHelper
  def default_meta_tags
    {
      site: 'LGHTM CREATOR',
      title: @title || 'LGHTM CREATOR',
      reverse: true,
      charset: 'utf-8',
      description: '絵文字を打つだけで簡単にLGTM文を作成できるアプリです',
      keywords: 'SNS',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
