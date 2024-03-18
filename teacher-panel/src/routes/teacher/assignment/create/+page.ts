import type { PageLoad } from './$types';

export const load: PageLoad = ({ params }) => {
	return {
	    assignmentConfigs: [
            {
                name: `Config1`,
                content: `Some configurations....`,
            },
            {
                name: `Config2`,
                content: `Some configurations....`,
            },
            {
                name: `Config3`,
                content: `Some configurations....`,
            },
       ]
	};
};