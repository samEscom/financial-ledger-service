import { createSchema } from 'graphql-yoga';
import { resolvers } from '@/src/interfaces/graphql/resolvers.js';
import { GraphQLContext } from '@/src/interfaces/graphql/context.js';

export const schema = createSchema<GraphQLContext>({
  typeDefs: /* GraphQL */ `
    type Query {
      healthCheck: String!
    }
  `,
  resolvers,
});
