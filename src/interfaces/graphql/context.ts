import { PrismaClient } from '@prisma/client';
import prisma from '@/src/infrastructure/prisma/prismaClient.js';
import { YogaInitialContext } from 'graphql-yoga';

export interface GraphQLContext extends YogaInitialContext {
    prisma: PrismaClient;
}

export const createContext = async (initialContext: YogaInitialContext): Promise<GraphQLContext> => {
    return {
        ...initialContext,
        prisma,
    };
};
