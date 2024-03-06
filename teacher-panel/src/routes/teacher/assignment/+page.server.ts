import type { PageLoad } from './$types';

export const load: PageLoad = () => {
	// We need to know which teacher we are.
    // To be able to get the assignments for the teacher.
    return {
	    assignmnets: [
            {
                title: `Assignment1`,
                course: `DM861`,
                config: `Config1`,
                isVisible: true,
                startDate: `2021-09-01`,
                endDate: `2021-09-15`,
            },
            {
                title: `Assignment2`,
                course: `DM535`,
                config: `Config1`,
                isVisible: true,
                startDate: `2021-09-08`,
                endDate: `2021-09-10`,
            },
            {
                title: `Assignment3`,
                course: `DM882`,
                config: `Config2`,
                isVisible: false,
                startDate: `2021-10-01`,
                endDate: `2021-12-15`,
            },
       ]
	};
};