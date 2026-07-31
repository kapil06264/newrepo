Facter.add(:cos_managed_agent_installed) do
  confine :kernel => 'Linux'
  setcode do
    if Facter::Util::Resolution.which('rpm')
      result = Facter::Core::Execution.execute('rpm -q cos-managed-agent 2>/dev/null')
      result.include?('cos-managed-agent')
    elsif Facter::Util::Resolution.which('dpkg-query')
      result = Facter::Core::Execution.execute('dpkg-query -W cos-managed-agent 2>/dev/null')
      !result.empty?
    else
      false
    end
  end
end
