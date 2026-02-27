import { UserAccount } from '@/src/domain/entities/Account.js';
import { AccountRepository } from '@/src/domain/repositories/AccountRepository.js';

export class CreateAccount {
    constructor(private accountRepository: AccountRepository) { }

    async execute(data: { name: string, email: string, updatedBy: string, createdBy: string, isActive: boolean }): Promise<UserAccount> {
        const account = new UserAccount(
            crypto.randomUUID(),
            data.name,
            data.email,
            new Date(),
            new Date(),
            data.updatedBy,
            data.createdBy,
            data.isActive
        );
        await this.accountRepository.create(account);
        return account;
    }
}
