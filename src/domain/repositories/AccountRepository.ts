import { UserAccount } from '@/src/domain/entities/Account.js';

export interface UserAccountRepository {
    create(account: UserAccount): Promise<void>;
    findById(id: string): Promise<UserAccount | null>;
    findAll(): Promise<UserAccount[]>;
    update(account: UserAccount): Promise<void>;
    delete(id: string): Promise<void>;
}
