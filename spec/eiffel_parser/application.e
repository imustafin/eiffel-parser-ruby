class
	APPLICATION

create
	make

feature

	attr: INTEGER

	make
			-- Start the program
		do
			greet ("world")
			greet ("")
		end

	greet (a_name: STRING_8)
			-- Prints a message greeting `a_name`
		note
			string_note: "str"
		local
			full_message: STRING_8
		do
			if a_name.is_empty then
				full_message := "Hello!"
			else
				full_message := "Hello, " + titleize (a_name) + "!"
			end
			print (full_message + "%N")
		end

	titleize (a_string: STRING): STRING
			-- Upcase the first letter of the string
		require
			not_too_long: a_string.count < 100
		local
			initial_upcased: STRING
		do
			if a_string.is_empty then
				Result := a_string
			else
				initial_upcased := a_string [1].as_upper.out
				Result := initial_upcased + a_string.substring (2, a_string.count)
			end
		ensure
			empty_if_given_empty: Result.is_empty implies Result ~ a_string
			titleized_if_not_empty: not Result.is_empty implies Result ~ (a_string [1].as_upper.out + a_string.substring (2, a_string.count))
		end

end
