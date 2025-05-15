# Если проблемы с подключением
# $Env:VAGRANT_PREFER_SYSTEM_BIN += 0 
# vagrant ssh

#ENV['VAGRANT_SERVER_URL'] = 'http://vagrant.elab.pro'

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "vagrant-lxc-host"

  config.vm.synced_folder ".", "/vagrant", disabled: true 

  # Настройки железа (16 ГБ ОП и 4 ядра)
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "16384"
    vb.cpus = 4
  end

  # Провижионинг через shell (дополнительная логика на момент установки)
  config.vm.provision "shell", inline: <<-SHELL
  SHELL

end
