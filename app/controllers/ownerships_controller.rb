class OwnershipsController < ApplicationController
  def create
    @item = Item.find_or_initialize_by(code: params[:item_code])

    unless @item.persisted?
      # @item が保存されていない場合、先に @item を保存する
      results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)

      @item = Item.new(read(results.first))
      @item.save
    end

    # have 関係として保存
    if params[:type] == 'have'
      current_user.have(@item)
      flash[:success] = '商品を have しました。'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])

    if params[:type] == 'have'
      current_user.unhave(@item) 
      flash[:success] = '商品の have を解除しました。'
    end

    redirect_back(fallback_location: root_path)
  end
end