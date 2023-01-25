require_relative '../../classes/Account'
require_relative '../../modules/Utilities'

puts 'hello!'

describe Account do
  describe '#initialize' do
    # my_account = Account.new('karen', '100','1231231234')
    context 'when provided good input' do
      it { expect(described_class.new('karen', '100', '1231231234')).to be_an_instance_of(Account) }
    end

    context 'when given bad input' do
      it { expect { described_class.new('karen', '100') }.to raise_error(ArgumentError) } # specific error
    end
  end

  describe '#add_interest' do
    subject(:my_account) do
      described_class.new('karen', '100', '1231231234')
    end
    context 'when given a positive percentage' do
      it { expect(my_account.add_interest(0.1)).to eq(110) }
    end

    context 'when given a negative percentage' do
      it { expect(my_account.add_interest(-0.2)).to eq(80) }
    end

    context 'when given string' do
      it { expect { my_account.add_interest('add') }.to raise_error(TypeError) }
    end

    context 'when nothing passed' do
      it { expect { my_account.add_interest }.to raise_error(ArgumentError) }
    end
  end

  describe '#add_balance' do
    subject(:account) { described_class.new('lee', '200', '1231231234') }

    context 'when given a positive number' do
      it { expect(account.add_balance(90)).to eq(290) }
      # for .eq, expect needs argument not block.
    end

    context 'when given negative number' do
      it { expect { account.add_balance(-300) }.to output("Less than 0 or string.\nInvaid input!\n").to_stdout }
    end
  end

  describe '#withdrawl_balance' do
    subject(:my_account) do
      described_class.new('lee', '10', '1231231234')
    end

    context 'when given positive number' do
      it { expect(my_account.withdrawl_balance(100)).to eq(-90) }
    end
    context 'when given float' do
      it { expect(my_account.withdrawl_balance(1.5)).to eq(8.5) }
    end

    context 'when given negative number' do
      it {
        expect do
          my_account.withdrawl_balance(-100)
        end.to output("Less than 0 or string.\nInvaid input!\n").to_stdout
      }
    end
  end
end
