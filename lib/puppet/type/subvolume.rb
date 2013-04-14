# Puppet type to represent a btrfs subvolume.
Puppet::Type.newtype(:subvolume) do
  # Doc-string:
  @doc = <<-'EOT'
       Manages btrfs subvolumes.

         Example:
           
           subvolume { "/data/subvolname":
	     ensure => exists,
           }
  EOT

  # We know how to ensure our presence:
  ensurable

  # Parameter: path
  newparam(:path, :namevar => true) do
    desc 'The local path the subvolume is to be created at.'
  end

end
