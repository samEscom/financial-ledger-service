export class UserAccount {
    constructor(
        public readonly id: string,
        public readonly name: string,
        public readonly email: string,
        public readonly createdAt: Date,
        public readonly updatedAt: Date,
        public readonly updatedBy: string,
        public readonly createdBy: string,
        public readonly isActive: boolean,
    ) { }
}
