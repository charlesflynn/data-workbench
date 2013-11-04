# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "workbench-centos64-x64-vmware"
  config.vm.provider "vmware_workstation" do |v|
    v.vmx["vcpu.hotadd"] = "TRUE"
    v.vmx["numvcpus"] = "4"
    v.vmx["cpuid.coresPerSocket"] = "1"
    v.vmx["mem.hotadd"] = "TRUE"
    v.vmx["memsize"] = "4096"
  end
end
