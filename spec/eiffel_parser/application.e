class
	APPLICATION

create
	make

feature

	attr: INTEGER

	make
			-- Start the program
		do
			greet ("World")
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
				full_message := "Hello, " + a_name + "!"
			end
			print (full_message + "%N")
		end

end
