Facter.add(:monitoring_system) do
   confine :kernel => 'linux'
   setcode do
      if File.exist? "/etc/icinga"
         result = "icinga"
         result
      elsif File.exist? "/etc/nagios3"
         result = "nagios"
         result
      end
   end
end
