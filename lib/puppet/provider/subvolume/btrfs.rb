Puppet::Type.type(:subvolume).provide(:btrfs) do
  desc "Provides support to manage btrfs subvolumes"

  # The btrfs command => puppet converts this into a handy method:
  commands :btrfscmd => "btrfs"

  def create
    btrfscmd :subvolume, :create, @resource[:path]
  end

  def destroy
    btrfscmd :subvolume, :delete, @resource[:path]
  end

  def exists?
    matched = /^(.*)\/(.*?)$/.match(@resource[:path])
    filesys = matched[1]
    subvol = matched[2]

    #TODO: this should also support nested subvolumes:
    if btrfscmd(:subvolume, :list, filesys).split("\n").detect { |line| line.split("\s")[-1] == subvol }
      true
    else
      false
    end
  end
  
end
