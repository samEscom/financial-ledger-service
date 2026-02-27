import { UserAccount } from '@/src/domain/entities/Account.js';
import { UserAccountRepository } from '@/src/domain/repositories/AccountRepository.js';
import { PrismaClient } from '@prisma/client';

export class PrismaUserAccountRepository implements UserAccountRepository {
    constructor(private prisma: PrismaClient) { }

    async create(account: UserAccount): Promise<void> {
        // Implementation placeholder
    }

    async findById(id: string): Promise<UserAccount | null> {
        // Implementation placeholder
        return null;
    }

    async findAll(): Promise<UserAccount[]> {
        // Implementation placeholder
        return [];
    }

    async update(account: UserAccount): Promise<void> {
        // Implementation placeholder
    }

    async delete(id: string): Promise<void> {
        // Implementation placeholder
    }
}
