module MetafieldsHelper
	def format_key(key)
		key.humanize.split.map(&:capitalize).join(' ')
	end
end