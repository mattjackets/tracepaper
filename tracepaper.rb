#!/usr/bin/env ruby
###############################################################################
#   Copyright (c) 2008, Matthew F. Coates
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

class String
  def isImage
    if (self =~ /.*\.[jJ][pP][gG]$/)
      return true
    else
      return false
    end
  end
end
class TracepaperGlade
  include GetText

  attr :glade
  
  def initialize(path_or_data, root = nil, domain = nil, localedir = nil, flag = GladeXML::FILE)
    bindtextdomain(domain, localedir, nil, "UTF-8")
    @glade = GladeXML.new(path_or_data, root, domain, localedir, flag) {|handler| method(handler)}
    
    @image= @glade.get_widget("image")
    @info = @glade.get_widget("info")
    @opath= ARGV[1]
    @spath= ARGV[0]
    @odir = Dir.entries(@opath).sort
    @sdir = Dir.entries(@spath).sort
    @oimage = ""
    @simage = ""
    @opos = next_image @odir,-1,@opath,@oimage
    @spos = next_image @sdir,-1,@spath,@simage
    compose
    GC.start
  end

  def next_image(dir,pos,path,image)
     filename=""
     while (not filename.isImage)
       pos+=1
       if pos == dir.size
         pos=0
       end
       filename=dir[pos]
       unless FileTest.exists?(path+"/"+filename)
         @odir = Dir.entries(@opath).sort
         @sdir = Dir.entries(@spath).sort
         filename=""
       end
    end
    image.replace path+"/"+filename
    return pos
  end

  def prev_image(dir,pos,path,image)
     filename=""
     while (not filename.isImage)
       pos-=1
       if pos == -1
         pos=dir.size-1
       end
       filename=dir[pos]
       unless FileTest.exists?(path+"/"+filename)
         @odir = Dir.entries(@opath).sort
         @sdir = Dir.entries(@spath).sort
         if @opath == path
           next_image @sdir,@spos,@spath,@simage
         else
           next_image @odir,@opos,@opath,@oimage
         end
         filename=""
       end
    end
    image.replace path+"/"+filename
    return pos
  end

  def on_ofr_clicked(widget)
    if @opos < 50
      @opos=0
    else
      @opos -= 50
    end
    @opos = next_image @odir,@opos,@opath,@oimage
    puts @info.text = @oimage+" loaded as overlay."
    compose 128
    GC.start
  end

  def on_oprev_clicked(widget)
    @opos = prev_image @odir,@opos,@opath,@oimage
    puts @info.text = @oimage+" loaded as overlay."
    compose 128
    GC.start
  end

  def on_onext_clicked(widget)
    @opos = next_image @odir,@opos,@opath,@oimage
    puts @info.text = @oimage+" loaded as overlay."
    compose 128
    GC.start
  end

  def on_off_clicked(widget)
    @opos += 50
    @opos = @odir.size if @opos > @odir.size
    @opos = prev_image @odir,@opos,@opath,@oimage
    puts @info.text = @oimage+" loaded as overlay."
    compose 128
    GC.start
  end

  def on_sfr_clicked(widget)
    if @spos < 50
      @spos=0
    else
      @spos -= 50
    end
    @spos = next_image @sdir,@spos,@spath,@simage
    puts @info.text = @simage+" loaded as source."
    compose
    GC.start
  end

  def on_sprev_clicked(widget)
    @spos = prev_image @sdir,@spos,@spath,@simage
    puts @info.text = @simage+" loaded as source."
    compose 128
    GC.start
  end

  def on_snext_clicked(widget)
    @spos = next_image @sdir,@spos,@spath,@simage
    puts @info.text = @simage+" loaded as source."
    compose 128
    GC.start
  end

  def on_sff_clicked(widget)
    @spos += 50
    @spos = @sdir.size if @spos > @sdir.size
    @spos = prev_image @sdir,@spos,@spath,@simage
    puts @info.text = @simage+" loaded as overlay."
    compose
    GC.start
  end

  def on_sfile_clicked(widget)
    puts @info.text = "on_oprev_clicked() is not implemented yet."
  end
  def on_ofile_clicked(widget)
    puts @info.text = "on_oprev_clicked() is not implemented yet."
  end
  def on_window1_delete_event(widget, arg0)
    Gtk.main_quit
  end
  
  def compose(alpha=128)
    i1=Gdk::Pixbuf.new(@simage)
    i2=Gdk::Pixbuf.new(@oimage)
    result = i1.composite!(i2, 0,0, 
                      i2.width,i2.height,
                      0,0,1,1,Gdk::Pixbuf::INTERP_NEAREST,
                      alpha)
    @image.set(result)
  end
    
end

# Main program
if __FILE__ == $0
  # Set values as your own application. 
  PROG_PATH = "tracepaper.glade"
  PROG_NAME = "YOUR_APPLICATION_NAME"
  usage = "Usage: "+$0+" <source image directory> <overlay image directory>"
  sd = ARGV[0]
  od = ARGV[1]
  puts "Width: "+Gdk::Screen.default.width.to_s+" Height: "+Gdk::Screen.default.height.to_s
  if sd.nil? || od.nil?
    puts "Two arguments required"
    puts usage
    exit 1
  end
  unless File.directory?(sd) && File.directory?(od)
    puts "Both arguments must be directories"
    puts usage
    exit 1
  end

  TracepaperGlade.new(PROG_PATH, nil, PROG_NAME)
  Gtk.main
end
