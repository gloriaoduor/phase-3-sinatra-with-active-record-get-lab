class ApplicationController < Sinatra::Base

  # add routes
  get '/bakeries' do 
    bk = Bakery.all
    bk.to_json
  end


  get '/bakeries/:id' do 
    bk = Bakery.find(params[:id])
    bk.to_json(include: :baked_goods)
  end 

  get '/baked_goods/by_price' do
    bkgoods = BakedGood.all.order('price DESC')
    bkgoods.to_json
  end 

  get '/baked_goods/most_expensive' do 
    baked_good = BakedGood.all.order('price DESC').first
    baked_good.to_json
  end 

end
