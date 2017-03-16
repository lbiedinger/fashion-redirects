# frozen_string_literal: true
[
  { src: '/', dst: '/portal/collections/fashion', site: 'portal' },
  { src: '/portal/home.html', dst: '/portal/collections/fashion', site: 'portal' },
  { src: '/portal/browse.html', dst: '/portal/collections/fashion?q=', site: 'portal' },
  { src: '/portal/themeoverview.html', dst: '/portal/explore/galleries?theme=fashion', site: 'portal' },
  { src: '/portal/blogoverview.html', dst: '/portal/blogs?theme=fashion', site: 'portal' },
  { src: '/portal/eventoverview.html', dst: '/portal/events?theme=fashion', site: 'portal' },
  { src: '/portal/about.html', dst: '/europeana-fashion', site: 'pro' },
  { src: '/portal/contact.html', dst: '/europeana-fashion', site: 'pro' },
  { src: '/publications', dst: '/europeana-fashion', site: 'pro' },
  { src: '/publications/', dst: '/europeana-fashion', site: 'pro' },
  { src: '/press-releases', dst: '/europeana-fashion', site: 'pro' },
  { src: '/press-releases/', dst: '/europeana-fashion', site: 'pro' },
  { src: '/partners', dst: '/europeana-fashion', site: 'pro' },
  { src: '/partners/', dst: '/europeana-fashion', site: 'pro' },
].each do |attrs|
  redirect = Redirect.find_or_create_by(src: attrs[:src])
  redirect.dst = attrs[:dst]
  redirect.site = attrs[:site]
  redirect.save!
end
