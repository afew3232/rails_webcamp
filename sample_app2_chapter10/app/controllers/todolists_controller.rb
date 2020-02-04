class TodolistsController < ApplicationController
  def new
  	@list = List.new
  end

  def create
  	list = List.new(list_params)
  	list.save

    redirect_to todolist_path(list.id) #route.rbの 'todolist/:id'を参照する
  end

  def index
    #htmlで表示するため、インスタンスに@をつけている
  	@lists = List.all
  end

  def show
    @list = List.find(params[:id]) #routeからきたURL内の:idを取得
  end
  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  def destroy
    list = List.find(params[:id]) #レコード1行を取得
    list.destroy
    redirect_to todolists_path #一覧画面 show へリダイレクト
  end

private

	def list_params
		params.require(:list).permit(:title, :body, :image)
	end
end