class TestsController < ApplicationController
  def index
    @tests = Test.all
    @samples = Sample.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    # if @test.vali?
    p 'eeeeeeeeeeeeeeeeeeeeeeeeee'
    p @test
      if @test.save
      redirect_to tests_path
    else
      render 'new'
    end
  end

  private

  def test_params
    params.require(:test).permit(:name)
  end
end
