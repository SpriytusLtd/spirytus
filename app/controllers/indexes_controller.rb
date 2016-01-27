class IndexesController < ApplicationController
  def index
    @alcoholics = Alcoholic.all
    @brewers = Brewer.all
    @alcohol = [
      { text: '4%以下', number: 0 },
      { text: '9%以下', number: 1 },
      { text: '19%以下', number: 2 },
      { text: '39%以下', number: 3 },
      { text: '40%以上', number: 4 }
    ]
    @dishes = Dish.all
    @resorts = Resort.all
  end
end
