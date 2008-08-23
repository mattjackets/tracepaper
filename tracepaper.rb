#!/usr/bin/env ruby
###############################################################################
#   Copyright (c) 2006, Matthew F. Coates
#   All rights reserved.
# 
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of source code must retain the above copyright notice,
#      this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#   3. All advertising materials mentioning features or use of this software
#      must display the following acknowledgement:
#          "This product includes software developed by Matthew F. Coates"
#   4. The name of the author "Matthew F. Coates" may not be used to endorse
#      or promote products derived from this software without specific prior
#      written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER "AS IS"
#   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER BE
#   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
#   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
#   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
#   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
#   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
#   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
#   THE POSSIBILITY OF SUCH DAMAGE.
###############################################################################

#
# This file is gererated by ruby-glade-create-template 1.1.4.
#
require 'libglade2'

class TracepaperGlade
  include GetText

  attr :glade
  
  def initialize(path_or_data, root = nil, domain = nil, localedir = nil, flag = GladeXML::FILE)
    bindtextdomain(domain, localedir, nil, "UTF-8")
    @glade = GladeXML.new(path_or_data, root, domain, localedir, flag) {|handler| method(handler)}
    
  end
  
  def on_oprev_clicked(widget)
    puts "on_oprev_clicked() is not implemented yet."
  end
  def on_onext_clicked(widget)
    puts "on_onext_clicked() is not implemented yet."
  end
  def on_snext_clicked(widget)
    puts "on_snext_clicked() is not implemented yet."
  end
  def on_sfile_clicked(widget)
    puts "on_sfile_clicked() is not implemented yet."
  end
  def on_sprev_clicked(widget)
    puts "on_sprev_clicked() is not implemented yet."
  end
  def on_ofile_clicked(widget)
    puts "on_ofile_clicked() is not implemented yet."
  end
  def on_window1_delete_event(widget, arg0)
    puts "on_window1_delete_event() is not implemented yet."
  end
end

# Main program
if __FILE__ == $0
  # Set values as your own application. 
  PROG_PATH = "tracepaper.glade"
  PROG_NAME = "YOUR_APPLICATION_NAME"
  TracepaperGlade.new(PROG_PATH, nil, PROG_NAME)
  Gtk.main
end
