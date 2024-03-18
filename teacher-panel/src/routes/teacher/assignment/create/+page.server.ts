import type { Actions } from './$types';

export const actions = {
	default: async ({ cookies, request }) => {
		const data = await request.formData();

        //TODO: Handle the form data. Insert into database.

        console.log(data);
        return { success: true };

	},
} satisfies Actions;