import dotenv from 'dotenv';
dotenv.config();

import { createYoga } from 'graphql-yoga';
import { createServer } from 'node:http';
import { schema } from '@/src/interfaces/graphql/schema.js';
import { createContext, GraphQLContext } from '@/src/interfaces/graphql/context.js';


const yoga = createYoga<GraphQLContext>({
    schema,
    context: createContext,
});

const server = createServer(yoga);

const PORT = Number(process.env.PORT) || 4000;

server.listen(PORT, () => {
    console.info(`Server is running on http://localhost:${PORT}/graphql`);
});
