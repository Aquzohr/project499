class PackageController < ApplicationController
  def index
  	@nontrainer_packages = NontrainerPackage.all
  	@trainer_packages = TrainerPackage.all
  end
end
