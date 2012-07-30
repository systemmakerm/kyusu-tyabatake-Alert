require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AlertController < Rho::RhoController
  include BrowserHelper

  def index
    render :action => :index
  end

  #ポップアップ機能
  def popup
    Alert.show_popup(
      #表示するメッセージを指定
      :message => "Rhodesアラートポップアップ機能です",
      #ポップアップのタイトルを指定
      :title => "お知らせ",
      #表示するボタンを配列で指定(idを指定すると、コールバックにidがパラメータとして渡される)
      :buttons => ["同意", "同意しない", {:id => :cancel, :title => "キャンセル"}],
      #ポップアップを表示した時のコールバックを指定(省略可能)
      :callback => url_for(:action => :popup_callback)
      )
    render :action => :index
  end

  #コールバック
  def popup_callback
    #画面をindexに移動
    WebView.navigate(url_for(:action => :index))
  end

  #バイブレート機能
  def vibrate
    #端末を5秒間バイブレートさせる(ミリセカンド)
    Alert.vibrate(5000)
    render :action => :index
  end
end
