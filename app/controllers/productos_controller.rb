class ProductosController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
  @productos = Producto.all
  end

  def show
  @producto = Producto.find(params[:id])
  end

  def new
    @producto = Producto.new
  end

  def edit
  @producto = Producto.find(params[:id])
  end

  def create
    @producto = Producto.new(producto_params)

     if @producto.save
       redirect_to @producto
     else
       render 'new'
     end
  end

  def update
  @producto = Producto.find(params[:id])

  if @producto.update(producto_params)
    redirect_to @producto
  else
    render 'edit'
  end
end
  def destroy
  @producto = Producto.find(params[:id])
  @producto.destroy

  redirect_to productos_path
  end


  private
  def producto_params
    params.require(:producto).permit(:title, :text)
  end
end
