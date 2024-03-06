import type { Actions } from './$types';

export const actions = {
	default: async ({ cookies, request }) => {
		const data = await request.formData();

        //TODO: Handle the form data. Insert into database.

        console.log(data);
        return { success: true };

	},
} satisfies Actions;

import type { PageLoad } from './$types';
export const load: PageLoad = () => {
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