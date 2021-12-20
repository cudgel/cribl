# frozen_string_literal: true

require 'spec_helper'

describe 'cribl' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
    context "install on #{os}" do
      let(:params) do
        {
          'install_path' => '/opt/'
        }
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('cribl') }
      it { is_expected.to contain_class('cribl::install') }
      it { is_expected.to contain_exec('mk_install_dir') }
    end
  end
end
